package Win32::KeyState;

use 5.006;
use strict;
use warnings;
our $VERSION = '0.01';

require Exporter;
our @ISA = qw(Exporter);

our @get = qw(GetCapsLock GetNumLock GetScrollLock GetKeyState); # currently implemented
our @set = qw(SetCapsLock SetNumLock SetScrollLock); # for the future

our %EXPORT_TAGS = (
  get => [@get],
  set => [@set],
  all => [@get, @set],
);

Exporter::export_ok_tags('all');


use Win32::API 0.41;

#Win32::API->Import('user32', 'int GetKeyState(int nVirtKey)');
# commented out due to warnings
# Win32::API::parse_prototype: WARNING unknown parameter type 'int' at C:/Perl/site/lib/Win32/API.pm line 248.
# Win32::API::parse_prototype: WARNING unknown output parameter type 'int' at C:/Perl/site/lib/Win32/API.pm line 273.

Win32::API->Import('user32', 'GetKeyState', 'I', 'I');

sub GetCapsLock {
  GetKeyState(0x14) & 1;
}

sub GetNumLock {
  GetKeyState(0x90) & 1;
}

sub GetScrollLock {
  GetKeyState(0x91) & 1;
}

sub SetCapsLock {}   # Not yet implemented

sub SetNumLock {}    # Not yet implemented

sub SetScrollLock {} # Not yet implemented

1;

=head1 NAME

Win32::KeyState - Get the status of "virtual" keys

=head1 SYNOPSIS

  use Win32::KeyState qw(:get);

  print 'CapsLock is ', GetCapsLock() ? 'On' : 'Off', "\n";
  print "Shift key is depressed\n" if (GetKeyState(0x10) & 1);

=head1 DESCRIPTION

These functions utilizes L<Win32::API> to allow one to get the status of the CapsLock, NumLock and ScrollLock keys.

=head1 FUNCTIONS

=over 3

=item B<GetKeyState>

Returns the raw key state information.  To determine the boolean state,
take the return value and perform a bitwise and with 1.

=item B<GetCapsLock>

Returns true if CapsLock is on.

=item B<GetNumLock>

Returns true if NumLock is on.

=item B<GetScrollLock>

Returns true if ScrollLock is on.

=item B<SetCapsLock>

Sets (or unsets) CapsLocks.  (Not yet implemented)

=item B<SetNumLock>

Sets (or unsets) NumLock.  (Not yet implemented)

=item B<SetScrollLock>

Sets (or unsets) ScrollLock.  (Not yet implemented)

=back

=head1 TODO

=over 4

=item Set*Lock

I would love to be able to set the status of CapsLock, NumLock & ScrollLock with Perl.  I
have started reading the M$ documentation that describes how to do this.  This will be
implemented if I figure it out. ;-)

=back

=head1 CREDITS

dada <dada@perl.it> for creating L<Win32::API>

=head1 SEE ALSO

L<perl>, L<Win32>, L<Win32::API>

=head1 AUTHOR

Matthew Musgrove <muskrat@mindless.com>

=cut

