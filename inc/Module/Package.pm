#line 1
##
# name:      Module::Package
# abstract:  Postmodern Perl Module Packaging
# author:    Ingy döt Net <ingy@cpan.org>
# license:   perl
# copyright: 2011

package Module::Package;
use 5.005;
use strict;

$Module::Package::VERSION = '0.12';

sub import {
    eval "use inc::Module::Install 1.01 (); 1" or die $@;

    my $class = shift;
    package main;
    inc::Module::Install->import();
    eval {
        module_package_internals_version_check($Module::Package::VERSION);
        module_package_internals_init(@_);
    };
    if ($@) {
        $Module::Package::ERROR = $@;
        die $@;
    }
}

1;

