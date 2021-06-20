package ONVIF::Analytics::Types::H264DecOptions;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://www.onvif.org/ver10/schema' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %ResolutionsAvailable_of :ATTR(:get<ResolutionsAvailable>);
my %SupportedH264Profiles_of :ATTR(:get<SupportedH264Profiles>);
my %SupportedInputBitrate_of :ATTR(:get<SupportedInputBitrate>);
my %SupportedFrameRate_of :ATTR(:get<SupportedFrameRate>);

__PACKAGE__->_factory(
    [ qw(        ResolutionsAvailable
        SupportedH264Profiles
        SupportedInputBitrate
        SupportedFrameRate

    ) ],
    {
        'ResolutionsAvailable' => \%ResolutionsAvailable_of,
        'SupportedH264Profiles' => \%SupportedH264Profiles_of,
        'SupportedInputBitrate' => \%SupportedInputBitrate_of,
        'SupportedFrameRate' => \%SupportedFrameRate_of,
    },
    {
        'ResolutionsAvailable' => 'ONVIF::Analytics::Types::VideoResolution',
        'SupportedH264Profiles' => 'ONVIF::Analytics::Types::H264Profile',
        'SupportedInputBitrate' => 'ONVIF::Analytics::Types::IntRange',
        'SupportedFrameRate' => 'ONVIF::Analytics::Types::IntRange',
    },
    {

        'ResolutionsAvailable' => 'ResolutionsAvailable',
        'SupportedH264Profiles' => 'SupportedH264Profiles',
        'SupportedInputBitrate' => 'SupportedInputBitrate',
        'SupportedFrameRate' => 'SupportedFrameRate',
    }
);

} # end BLOCK








1;


=pod

=head1 NAME

ONVIF::Analytics::Types::H264DecOptions

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
H264DecOptions from the namespace http://www.onvif.org/ver10/schema.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * ResolutionsAvailable


=item * SupportedH264Profiles


=item * SupportedInputBitrate


=item * SupportedFrameRate




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # ONVIF::Analytics::Types::H264DecOptions
   ResolutionsAvailable =>  { # ONVIF::Analytics::Types::VideoResolution
     Width =>  $some_value, # int
     Height =>  $some_value, # int
   },
   SupportedH264Profiles => $some_value, # H264Profile
   SupportedInputBitrate =>  { # ONVIF::Analytics::Types::IntRange
     Min =>  $some_value, # int
     Max =>  $some_value, # int
   },
   SupportedFrameRate =>  { # ONVIF::Analytics::Types::IntRange
     Min =>  $some_value, # int
     Max =>  $some_value, # int
   },
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

