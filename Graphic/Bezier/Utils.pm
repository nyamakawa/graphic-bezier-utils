package Graphic::Bezier::Utils;

use strict;
use utf8;

sub quadric {
    my ($t, $p1, $p2, $p3, $p4) = @_;
    my $t2 = 1.0 - $t;

    return $p1 * ($t2 ** 3)
      + 3.0 * $p2 * ($t2 ** 2) * $t
      + 3.0 * $p3 * $t2 * ($t ** 2)
      + $p4 * ($t ** 3);
}

sub first_derivative {
    my ($t, $p1, $p2, $p3, $p4) = @_;
    my $t2 = 1.0 - $t;

    return 3.0 * ($t2 ** 2) * ($p2 - $p1)
      + 6.0 * $t2 * $t * ($p3 - $p2)
      + 3.0 * ($t ** 2) * ($p4 - $p3);
}

sub second_derivative {
    my ($t, $p1, $p2, $p3, $p4) = @_;

    return 6 * (1.0 - $t) * ($p3 - 2 * $p2 + $p1)
      + 6 * $t * ($p4 - 2 * $p3 + $p2);
}

sub normal {
    my ($t, $p1, $p2, $p3, $p4) = @_;

    my $d = derivative($t, $p1, $p2, $p3, $p4);
}

sub split_curve {
    my ($t, $p1, $p2) = @_;
    return $p1 + ($p2 - $p1) * $t;
}

sub de_casteljau {
    my ($t, $p0, $p1, $p2, $p3) = @_;
    
    my $b1 = split_line($t, $p0, $p1);
    my $b2 = split_line($t, $p1, $p2);
    my $b3 = split_line($t, $p2, $p3);
    my $c1 = split_line($t, $b1, $b2);
    my $c2 = split_line($t, $b2, $b3);
    my $d1 = split_line($t, $c1, $c2);

    return $b1, $b2, $b3, $c1, $c2, $d1;
}

sub nearest_for {
    my ($x, $y, @curve) = @_;

}


1;
