package Teleport::Model::Base;
use Mojo::Base -base;
use Teleport::DB;

has [qw{conf req_params}];

has db => sub {
    Teleport::DB->new( +{ conf => shift->conf } );
};

1;
