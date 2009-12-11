
use strict;
use Test::More tests => 1;

use Win32::KeyState qw(:all);
eval {
  GetCapsLock();
};
ok(!$@);
