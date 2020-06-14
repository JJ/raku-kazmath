use Test;

use kazmath;
use NativeCall;

is( kmSQR( 2.Num ),4, "Simple function works");
is-approx( kmDegreesToRadians(kmRadiansToDegrees(2.Num)),2, "Return values OK");
done-testing;

my CArray[num32] $riller .= new( 2.Num xx 16 );
my mat4 $one-mat .= new( );
ok($one-mat, "Declaration OK");
is($one-mat.mat.list[0],0, "Initialized OK");

my $returned-mat = kmMat4Fill( $one-mat, $riller);
is $returned-mat.mat[0], 2.Num, "First one filled correctly";
is $returned-mat.mat[15], 2.Num, "Last one filled correctly";
is $returned-mat.gist, "[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]",
 "Whole class";