#!/usr/bin/perl -w
# Copyleft 2009 Jens Pranaitis <jens@chaox.net>
# largly based on the example by Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
# This program may be used, modified, and distributed under the same
# terms as Perl itself. Please see the license that came with your Perl
# distribution for details.
use POE qw(Component::Server::Chargen);
if ($#ARGV != 1 ) {
  print "Usage: $0 address port\n";
  exit;
}
$bind_addr = $ARGV[0];
$bind_port = $ARGV[1];
my ($object) = POE::Component::Server::Chargen->spawn( Alias => 'Echo-Server', 
                                                       BindAddress => $bind_addr, 
                                                       BindPort => $bind_port, 
                                                       options => { trace => 1 } );
POE::Session->create(
	inline_states => { _start => \&simple_start,
			   _stop  => \&simple_stop, },
);

$poe_kernel->run();
exit 0;

sub simple_start {
}

sub simple_stop {
}
