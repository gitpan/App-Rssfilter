# ABSTRACT: App::Rssfilter's App::Cmd

use strict;
use warnings;
use feature qw< :5.14 >;

package App::Rssfilter::Cmd {
    use constant plugin_search_path => __PACKAGE__;
    use constant default_command => 'runfromconfig';
    use App::Cmd::Setup -app;
};
{
  $App::Rssfilter::Cmd::VERSION = '0.0.1_2';
}

1;

__END__

=pod

=head1 NAME

App::Rssfilter::Cmd - App::Rssfilter's App::Cmd

=head1 VERSION

version 0.0.1_2

=head1 AUTHOR

Daniel Holz <dgholz@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Daniel Holz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
