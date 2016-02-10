package ONVIF::Device::Types::Color;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://www.onvif.org/ver10/schema' };

our $XML_ATTRIBUTE_CLASS = 'ONVIF::Device::Types::Color::_Color::XmlAttr';

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}



# There's no variety - empty complexType
use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

__PACKAGE__->_factory();


package ONVIF::Device::Types::Color::_Color::XmlAttr;
use base qw(SOAP::WSDL::XSD::Typelib::AttributeSet);

{ # BLOCK to scope variables

my %X_of :ATTR(:get<X>);
my %Y_of :ATTR(:get<Y>);
my %Z_of :ATTR(:get<Z>);
my %Colorspace_of :ATTR(:get<Colorspace>);

__PACKAGE__->_factory(
    [ qw(
        X
        Y
        Z
        Colorspace
    ) ],
    {

        X => \%X_of,

        Y => \%Y_of,

        Z => \%Z_of,

        Colorspace => \%Colorspace_of,
    },
    {
        X => 'SOAP::WSDL::XSD::Typelib::Builtin::float',
        Y => 'SOAP::WSDL::XSD::Typelib::Builtin::float',
        Z => 'SOAP::WSDL::XSD::Typelib::Builtin::float',
        Colorspace => 'SOAP::WSDL::XSD::Typelib::Builtin::anyURI',
    }
);

} # end BLOCK




1;


=pod

=head1 NAME

ONVIF::Device::Types::Color

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
Color from the namespace http://www.onvif.org/ver10/schema.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over



=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

,



=head2 attr

NOTE: Attribute documentation is experimental, and may be inaccurate.
See the correspondent WSDL/XML Schema if in question.

This class has additional attributes, accessibly via the C<attr()> method.

attr() returns an object of the class ONVIF::Device::Types::Color::_Color::XmlAttr.

The following attributes can be accessed on this object via the corresponding
get_/set_ methods:

=over

=item * X



This attribute is of type L<SOAP::WSDL::XSD::Typelib::Builtin::float|SOAP::WSDL::XSD::Typelib::Builtin::float>.

=item * Y



This attribute is of type L<SOAP::WSDL::XSD::Typelib::Builtin::float|SOAP::WSDL::XSD::Typelib::Builtin::float>.

=item * Z



This attribute is of type L<SOAP::WSDL::XSD::Typelib::Builtin::float|SOAP::WSDL::XSD::Typelib::Builtin::float>.

=item * Colorspace



This attribute is of type L<SOAP::WSDL::XSD::Typelib::Builtin::anyURI|SOAP::WSDL::XSD::Typelib::Builtin::anyURI>.


=back




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

