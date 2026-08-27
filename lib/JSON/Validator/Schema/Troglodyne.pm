package JSON::Validator::Schema::Troglodyne;

# ABSTRACT: Troglodyne extensions to the OpenAPIv3 schema validator.

use strict;
use warnings;

use 5.014;

use re '/aa';

use parent qw{JSON::Validator::Schema::OpenAPIv3};

use Data::Validate::Email();

=head1 JSON::Validator::Schema::Troglodyne

Troglodyne LLC's extensions to L<JSON::Validator::Schema::OpenAPIv3>.

There isn't a mechanism to inject validators into L<JSON::Validator::Formats>,
so here we are.

Relies entirely on the dynamic dispatch of validator methods via _validate_type_*name* subs being called.
If that changes upstream, this module will break.

=head2 TYPES

=head3 email

Uses L<Data::Validate::Email>::is_email() to validate your email field.

=cut

sub _validate_type_email {
    my ( $self, $input, $info ) = @_;
    my $path = $self->_troglodyne_path($info);
    return "wrong type, not email" if ref $input;
    return "$path ain't no email I never heard of pardner" unless Data::Validate::Email::is_email($input);
    return;
}

=head3 callback

Signify that this data is a string describing a fully qualified perl subroutine.

=cut

sub _validate_type_callback {
    my ( $self, $input, $info ) = @_;

    my $path = $self->_troglodyne_path($info);

    return "$path is not a fully qualified sub name" unless defined $input && !ref $input;
    my ($modname) = $input =~ m/^([\w:]+)::\w+$/;
    return "$path is not a fully qualified sub name" unless $modname;

    my $modpath = $modname;
    $modpath =~ s{::}{/}g;
    $modpath .= '.pm';

    local $@;
    # Require so we can check the sub exists, but don't dobule-require
    my @available = keys(%INC);
    my $loaded = any { m/\Q$modpath\E/ } @available;
    if (!$loaded) {
        eval { require $modpath; 1 } or return "$path refers to a module ($modname) which cannot be loaded";
    }

    no strict 'refs';
    return "$path refers to a sub which does not exist" unless ref \&{$input} eq 'CODE';
    return;
}

# Build the path the module usually does for errors
sub _troglodyne_path {
    my ($self, $input) = @_;
    return "$input->{base_url}/".join('/', @{$input->{path}});
}

1;
