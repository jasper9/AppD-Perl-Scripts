#!/usr/bin/perl

use XML::Simple qw(:strict);
use Data::Dumper;
use File::Fetch;


my $config = XMLin('/tmp/images.xml',
KeyAttr => { photo => 'id' },
VarAttr => 'name',
ForceArray => [ 'photo' ],
ContentKey => '-content');

#print Dumper($config);

#print $config->{photos}->{photo}->{'4662693906'}->{url_z};
#print $config->{photos}->{photo}->{url_z};
$n=0;
 while ( my ($key, $value) = each(%$config)) {
#        print "$key => $value\n";
                while ( my ($key2, $value2) = each(%$value)) {
                        #print "$key2 => $value2\n";
                                while ( my ($key3, $value3) = each(%$value2)) {
                                        #print "$key3 => $value3\n";
                                                while ( my ($key4, $value4) = each(%$value3)) {
                                                        #print "$key4 => $value4\n";
                                                        if($key4 eq "url_z")
                                                        {

                                                                #print "$value4\n";
                                                                system("wget -q --output-document=/tmp/images/$n.jpg --no-check-certificate $value4");
                                                                $n++;
                                                        }
                                                }
                                }
                }
    }

