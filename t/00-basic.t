use Test;

use kazmath;

is( kmSQR( 2.Num ),4, "Simple function works");
is-approx( kmDegreesToRadians(kmRadiansToDegrees(2.Num)),2, "Return values OK");
done-testing;

my num32 @filler[16] = 1.Num xx 16;
say @filler;