
package ONVIF::Device::Elements::CreateCertificate;
use strict;
use warnings;

{ # BLOCK to scope variables

sub get_xmlns { 'http://www.onvif.org/ver10/device/wsdl' }

__PACKAGE__->__set_name('CreateCertificate');
__PACKAGE__->__set_nillable();
__PACKAGE__->__set_minOccurs();
__PACKAGE__->__set_maxOccurs();
__PACKAGE__->__set_ref();

use base qw(
    SOAP::WSDL::XSD::Typelib::Element
    SOAP::WSDL::XSD::Typelib::ComplexType
);

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %CertificateID_of :ATTR(:get<CertificateID>);
my %Subject_of :ATTR(:get<Subject>);
my %ValidNotBefore_of :ATTR(:get<ValidNotBefore>);
my %ValidNotAfter_of :ATTR(:get<ValidNotAfter>);

__PACKAGE__->_factory(
    [ qw(        CertificateID
        Subject
        ValidNotBefore
        ValidNotAfter

    ) ],
    {
        'CertificateID' => \%CertificateID_of,
        'Subject' => \%Subject_of,
        'ValidNotBefore' => \%ValidNotBefore_of,
        'ValidNotAfter' => \%ValidNotAfter_of,
    },
    {
        'CertificateID' => 'SOAP::WSDL::XSD::Typelib::Builtin::token',
        'Subject' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'ValidNotBefore' => 'SOAP::WSDL::XSD::Typelib::Builtin::dateTime',
        'ValidNotAfter' => 'SOAP::WSDL::XSD::Typelib::Builtin::dateTime',
    },
    {

        'CertificateID' => 'CertificateID',
        'Subject' => 'Subject',
        'ValidNotBefore' => 'ValidNotBefore',
        'ValidNotAfter' => 'ValidNotAfter',
    }
);

} # end BLOCK







} # end of BLOCK



1;


=pod

=head1 NAME

ONVIF::Device::Elements::CreateCertificate

=head1 DESCRIPTION

Perl data type class for the XML Schema defined element
CreateCertificate from the namespace http://www.onvif.org/ver10/device/wsdl.







=head1 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * CertificateID

 $element->set_CertificateID($data);
 $element->get_CertificateID();




=item * Subject

 $element->set_Subject($data);
 $element->get_Subject();




=item * ValidNotBefore

 $element->set_ValidNotBefore($data);
 $element->get_ValidNotBefore();




=item * ValidNotAfter

 $element->set_ValidNotAfter($data);
 $element->get_ValidNotAfter();





=back


=head1 METHODS

=head2 new

 my $element = ONVIF::Device::Elements::CreateCertificate->new($data);

Constructor. The following data structure may be passed to new():

 {
   CertificateID =>  $some_value, # token
   Subject =>  $some_value, # string
   ValidNotBefore =>  $some_value, # dateTime
   ValidNotAfter =>  $some_value, # dateTime
 },

=head1 AUTHOR

Generated by SOAP::WSDL

=cut

