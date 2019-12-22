package Perinci::CmdLine::Base::Patch::DumpGetoptLongSpec;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
no warnings;

use Data::Dump::Color;
use Module::Patch;
use base qw(Module::Patch);

our %config;

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action      => 'wrap',
                sub_name    => '_parse_argv2',
                code        => sub {
                    my $ctx = shift;

                    my ($self) = @_;

                    my $ga_res = $ctx->{orig}->(@_);

                    dd $ga_res->[3]{'func.gen_getopt_long_spec_result'};
                    $ga_res;
                },
            },
        ],
        config => {
        },
   };
}

1;
# ABSTRACT: Patch Perinci::CmdLine::Base's _parse_argv2() to dump Getopt::Long spec

=for Pod::Coverage ^(patch_data)$

=head1 SYNOPSIS

 % PERL5OPT=-MPerinci::CmdLine::Base::Patch::DumpGetoptLongSpec yourscript.pl ...


=head1 DESCRIPTION

This patch can be used for debugging.
