# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

use Test::More tests => 10;

use Win32::KeyState qw(:all);

print "Turn off CapsLock, NumLock and ScrollLock.\n";
PressEnter(); 
ok(GetCapsLock() ==0, 'CapsLock is off? ( testing GetCapsLock() )');
ok(GetNumLock() == 0, 'NumLock is off? ( testing GetNumLock() )');
ok(GetScrollLock() == 0, 'ScrollLock is off? ( testing GetScrollLock() )');

print "Turn on CapsLock, NumLock and ScrollLock.\n";
PressEnter();
ok(GetCapsLock() == 1, 'CapsLock is on? ( testing GetCapsLock() )');
ok(GetNumLock() == 1, 'NumLock is on? ( testing GetNumLock() )');
ok(GetScrollLock() == 1, 'ScrollLock is on? ( testing GetScrollLock() )');

print "Hold down either shift key.\n";
PressEnter();
ok((GetKeyState(0x10) & 1) == 1, 'Shift key depressed? ( testing GetKeyState() )');

TODO: {
  local $TODO = 'Not yet implemented.';
  ok(SetCapsLock(0) == 1, 'Set CapsLock to off ( testing SetCapsLock() )');
  ok(SetNumLock(0) == 1, 'Set NumLock to off ( testing SetNumLock() )');
  ok(SetScrollLock(0) == 1, 'Set ScrollLock to off ( testing SetScrollLock() )');
}

sub PressEnter {
  print "Press <enter> to continue.\n";
  $_ = <STDIN>;
}
