
#include "zm_ffmpeg_input.h"
#include "zm_logger.h"
#include "zm_ffmpeg.h"

FFmpeg_Input::FFmpeg_Input() {
  input_format_context = NULL;
  video_stream_id = -1;
  audio_stream_id = -1;
}

FFmpeg_Input::~FFmpeg_Input() {
}

int FFmpeg_Input::Open( const char *filepath ) {

  int error;

  /** Open the input file to read from it. */
  if ((error = avformat_open_input( &input_format_context, filepath, NULL, NULL)) < 0) {

    Error("Could not open input file '%s' (error '%s')\n",
        filepath, av_make_error_string(error).c_str() );
    input_format_context = NULL;
    return error;
  } 

  /** Get information on the input file (number of streams etc.). */
  if ((error = avformat_find_stream_info( input_format_context, NULL)) < 0) {
    Error( "Could not open find stream info (error '%s')\n",
        av_make_error_string(error).c_str() );
    avformat_close_input(&input_format_context);
    return error;
  }

  for ( unsigned int i = 0; i < input_format_context->nb_streams; i += 1 ) {
    if ( is_video_stream( input_format_context->streams[i] ) ) {
      if ( video_stream_id == -1 ) {
        video_stream_id = i;
        // if we break, then we won't find the audio stream
        continue;
      } else {
        Warning( "Have another video stream." );
      }
    }
    if ( is_audio_stream( input_format_context->streams[i] ) ) {
      if ( audio_stream_id == -1 ) {
        audio_stream_id = i;
      } else {
        Warning( "Have another audio stream." );
      }
    }

#if LIBAVCODEC_VERSION_CHECK(57, 64, 0, 64, 0)
    streams[i].context = avcodec_alloc_context3( NULL );
    avcodec_parameters_to_context( streams[i].context, input_format_context->streams[i]->codecpar );
#else
    streams[i].context = input_format_context->streams[i]->codec;
#endif

    /** Find a decoder for the audio stream. */
    if (!(streams[i].codec = avcodec_find_decoder(input_format_context->streams[i]->codecpar->codec_id))) {
      Error( "Could not find input codec\n");
      avformat_close_input(&input_format_context);
      return AVERROR_EXIT;
    }

    /** Open the decoder for the audio stream to use it later. */
    if ((error = avcodec_open2( streams[i].context, streams[i].codec, NULL)) < 0) {
      Error( "Could not open input codec (error '%s')\n",
          av_make_error_string(error).c_str() );
      avcodec_free_context( &streams[i].context );
      avformat_close_input(&input_format_context);
      return error;
    }

  } // end foreach stream
  if ( video_stream_id == -1 )
    Error( "Unable to locate video stream in %s", filepath );
  if ( audio_stream_id == -1 )
    Debug( 3, "Unable to locate audio stream in %s", filepath );

  return 0;
} // end int FFmpeg::Open( const char * filepath )

AVPacket * FFmpeg_Input::read_packet() {
  AVPacket *packet = new AVPacket();
  if ( 0 > read_packet( packet ) ) {
    delete packet;
    packet = NULL;
  }
  return packet;
}

/* I am reserving a 0 return value to mean no error, but also no success */

int FFmpeg_Input::read_packet( AVPacket *packet ) {
  int avResult = av_read_frame( input_format_context, packet );
  char errbuf[AV_ERROR_MAX_STRING_SIZE];
  if ( avResult < 0 ) {
    av_strerror(avResult, errbuf, AV_ERROR_MAX_STRING_SIZE);
    if (
        // Check if EOF.
        (avResult == AVERROR_EOF || (input_format_context->pb && input_format_context->pb->eof_reached)) ||
        // Check for Connection failure.
        (avResult == -110)
       ) {
      Info( "av_read_frame returned \"%s\". Reopening stream.", errbuf );
      //ReopenFfmpeg();
    }

    Error( "Unable to read packet from stream %d: error %d \"%s\".", packet->stream_index, avResult, errbuf );
    return( -1 );
  }
  Debug( 5, "Got packet from stream %d dts (%d) pts(%d)", packet->stream_index, packet->pts, packet->dts );
  return 1;
}

AVFrame *FFmpeg_Input::decode_packet( AVPacket *packet ) {
  AVFrame *frame = new AVFrame();
  if ( 0 >= decode_packet( packet, frame ) ) {
    delete frame;
    frame = NULL;
  }
  return frame;
}

int FFmpeg_Input::decode_packet( AVPacket *packet, AVFrame *frame ) {
/* Decoding may take multiple packets. So a return value of 0 means no error, but no frame yet. */
  char errbuf[AV_ERROR_MAX_STRING_SIZE];
#if LIBAVCODEC_VERSION_CHECK(57, 64, 0, 64, 0)
  int ret = avcodec_send_packet( streams[packet->stream_index].context, packet );
  if ( ret < 0 ) {
    av_strerror( ret, errbuf, AV_ERROR_MAX_STRING_SIZE );
    Error( "Unable to send packet at frame: %s, continuing", errbuf );
    zm_av_packet_unref( packet );
    return ret;
  }
  ret = avcodec_receive_frame( streams[packet->stream_index].context, frame );
  if ( ret < 0 ) {
    av_strerror( ret, errbuf, AV_ERROR_MAX_STRING_SIZE );
    Error( "Unable to send packet at frame: %s, continuing", errbuf );
    return 0;
  }
# else
  int frameComplete;
  ret = zm_avcodec_decode_video( streams[packet->stream_index].context, frame, &frameComplete, packet );
  if ( ret < 0 ) {
    av_strerror( ret, errbuf, AV_ERROR_MAX_STRING_SIZE );
    Error( "Unable to decode frame at frame: %s, continuing", errbuf );
    zm_av_packet_unref( packet );
    return 0;
  }
#endif
  return 1;
}
