package Teleport::DB;
use Mojo::Base 'Teleport::DB::Base';
use Teleport::DB::Master;

has master => sub { Teleport::DB::Master->new(); };

1;
