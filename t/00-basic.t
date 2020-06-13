use Test;

use kazmath;

is( kmSQR( 2.Num ),4, "Simple function works");
is-approx( kmDegreesToRadians(kmRadiansToDegrees(2.Num)),2, "Return values OK");
done-testing;
