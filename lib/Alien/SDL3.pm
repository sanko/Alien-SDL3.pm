package Alien::SDL3 0.01 {
    use strict;
    use warnings;
    use File::ShareDir;
    use Path::Tiny;
    use Config;
    #
    sub dynamic_libs {
        my $files = path( File::ShareDir::dist_dir('Alien-SDL3') )->visit(
            sub {
                my ( $path, $state ) = @_;
                $state->{$path}++ if $path =~ m[\.$Config{so}$];
            },
            { recurse => 1 }
        );
    }

    sub features {
        require Alien::SDL3::ConfigData;
        my %features = map { $_ => Alien::SDL3::ConfigData->feature($_) }
            qw[SDL3 SDL3_image SDL3_mixer SDL3_ttf];
        return $features{ $_[1] } if defined $_[1];
        \%features;
    }
}
1;
__END__

=encoding utf-8

=head1 NAME

Alien::SDL3 - Build and install SDL3

=head1 SYNOPSIS

    use Alien::SDL3;

=head1 DESCRIPTION

Alien::SDL3 builds and installs L<SDL3|https://github.com/libsdl-org/SDL/>,
L<SDL_image|https://github.com/libsdl-org/SDL_image/>,
L<SDL_mixer|https://github.com/libsdl-org/SDL_mixer/>, and
L<SDL_ttf|https://github.com/libsdl-org/SDL_ttf/>. It is not meant for direct
use. Just ignore it for now.

=head1 LICENSE

Copyright (C) Sanko Robinson.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 AUTHOR


Sanko Robinson E<lt>sanko@cpan.orgE<gt>

=cut
