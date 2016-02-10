package ONVIF::Device::Types::Layout;
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

my %PaneLayout_of :ATTR(:get<PaneLayout>);
my %Extension_of :ATTR(:get<Extension>);

__PACKAGE__->_factory(
    [ qw(        PaneLayout
        Extension

    ) ],
    {
        'PaneLayout' => \%PaneLayout_of,
        'Extension' => \%Extension_of,
    },
    {
        'PaneLayout' => 'ONVIF::Device::Types::PaneLayout',
        'Extension' => 'ONVIF::Device::Types::LayoutExtension',
    },
    {

        'PaneLayout' => 'PaneLayout',
        'Extension' => 'Extension',
    }
);

} # end BLOCK








1;


=pod

=head1 NAME

ONVIF::Device::Types::Layout

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
Layout from the namespace http://www.onvif.org/ver10/schema.

A layout describes a set of Video windows that are displayed simultaniously on a display. 




=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * PaneLayout


=item * Extension




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # ONVIF::Device::Types::Layout
   PaneLayout =>  { # ONVIF::Device::Types::PaneLayout
     Pane => $some_value, # ReferenceToken
     Area => ,
   },
   Extension =>  { # ONVIF::Device::Types::LayoutExtension
   },
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

