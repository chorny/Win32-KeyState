#!/usr/bin/perl
use strict;
use warnings;
use Tk;
use Win32::KeyState qw(:get);

my ($num, $caps, $scroll);

my $main = MainWindow->new();
my $form = $main->Frame()->pack(-side => 'top');

my $cl = $form->Frame()->pack(-side => 'left');
my $capslock = $cl->Entry(-width => 8)->pack(-side => 'left');

my $nl = $form->Frame()->pack(-side => 'left');
my $numlock = $nl->Entry(-width => 8)->pack(-side => 'left');

my $sl = $form->Frame()->pack(-side => 'left');
my $scrolllock = $nl->Entry(-width => 8)->pack(-side => 'left');

$main->repeat(100, \&UpdateKeyStates);

MainLoop();

sub UpdateEntry {
  my $entry = shift;
  my $text = shift;
  $entry->delete(0, 'end');
  $entry->insert(0, $text);
}

sub UpdateKeyStates {
  $caps = GetCapsLock() ? 'Cap' : '';
  $num = GetNumLock() ? 'Num' : '';
  $scroll = GetScrollLock() ? 'Scroll' : '';
  UpdateEntry($capslock, $caps);
  UpdateEntry($numlock, $num);
  UpdateEntry($scrolllock, $scroll);
  $main->title($caps.$num.$scroll);
}
