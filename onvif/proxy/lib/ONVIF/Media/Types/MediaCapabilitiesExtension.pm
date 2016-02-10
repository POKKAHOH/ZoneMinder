package ONVIF::Media::Types::MediaCapabilitiesExtension;
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

my %ProfileCapabilities_of :ATTR(:get<ProfileCapabilities>);

__PACKAGE__->_factory(
    [ qw(        ProfileCapabilities

    ) ],
    {
        'ProfileCapabilities' => \%ProfileCapabilities_of,
    },
    {
        'ProfileCapabilities' => 'ONVIF::Media::Types::ProfileCapabilities',
    },
    {

        'ProfileCapabilities' => 'ProfileCapabilities',
    }
);

} # end BLOCK








1;


=pod

=head1 NAME

ONVIF::Media::Types::MediaCapabilitiesExtension

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
MediaCapabilitiesExtension from the namespace http://www.onvif.org/ver10/schema.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * ProfileCapabilities




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # ONVIF::Media::Types::MediaCapabilitiesExtension
   ProfileCapabilities =>  { # ONVIF::Media::Types::ProfileCapabilities
     MaximumNumberOfProfiles =>  $some_value, # int
   },
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

