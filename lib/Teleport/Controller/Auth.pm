package Teleport::Controller::Auth;
use Mojo::Base 'Teleport::Controller::Base';

sub index {
    my $self = shift;
    $self->render(text => 'index');
}

1;
