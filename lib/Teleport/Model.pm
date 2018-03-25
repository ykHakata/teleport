package Teleport::Model;
use Mojo::Base 'Teleport::Model::Base';
use Teleport::Model::Auth;

has auth => sub {
    Teleport::Model::Auth->new( +{ conf => shift->conf } );
};

# add method
# use Teleport::Model::Example;
# has example => sub {
#     Teleport::Model::Example->new( +{ conf => shift->conf } );
# };

# add helper method
# package Teleport;
# use Mojo::Base 'Mojolicious';
# use Teleport::Model;
#
# sub startup {
#    my $self = shift;
#    ...
#    my $config = $self->config;
#    $self->helper(
#        model => sub { Teleport::Model->new( +{ conf => $config } ); } );
#    ...
# }

1;
