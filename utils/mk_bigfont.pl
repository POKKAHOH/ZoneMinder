#!/usr/bin/env perl
#
# ==========================================================================
#
# ZoneMinder Big Font Generate Script
# Copyright (C) 2015 Robin Därmann
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
# ==========================================================================

# Basically, this script reads src/zm_font.h and duplicates every bit of every
# character found in that file. It then duplicates every generated line, so
# that every character effectively gets double sized.
# Output goes to STDOUT so it would be useful to redirect it to a file, i.e. to
# src/zm_bigfont.c

use strict;
use warnings;

my $in_head = 1;

open F, '<', '../src/zm_font.h';

print <<EOHEAD;
/***********************************************************/
/*                                                         */
/*       Font file generated by schrorg                    */
/*       based on the font file generated by rthelen       */
/*       using utils/mk_bigfont.pl                         */
/*                                                         */
/***********************************************************/
EOHEAD

while (my $line = <F>) {
    $in_head-- if $line =~ /^$/ and $in_head;
    next while $in_head;
    unless ($line =~ /^\s+(0x..), \/\* (........)/) {
      #$line =~ s/static unsigned char fontdata/static unsigned int bigfontdata/;
        print $line;
        next;
    }
    my $code = $1;
    my $bincode = $2;
    $bincode = "$1$1$2$2$3$3$4$4$5$5$6$6$7$7$8$8" if $bincode =~ /(.)(.)(.)(.)(.)(.)(.)(.)$/;
    #$bincode =~ s/ /1/g;
    #my $intcode = unpack("N", pack("B32", substr("0" x 32 . $bincode, -32)));
    #my $hexcode = sprintf("%#x", $intcode);
    #$hexcode =~ s/^0$/0x0/;
    #$bincode =~ s/1/ /g;
    print sprintf("\t%10s, /* %s */\n", $hexcode, $bincode);
    print sprintf("\t%10s, /* %s */\n", $hexcode, $bincode);
}

close F;