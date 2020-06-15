use Test;

use kazmath;
use NativeCall;

is( kmSQR( 2.Num ),4, "Simple function works");
is-approx( kmDegreesToRadians(kmRadiansToDegrees(2.Num)),2, "Return values OK");
done-testing;


my vec4 $v .= new( | ( 1.Num xx 4 ) );
is( $v.x, 1.Num, "First OK");
is( $v.w, 1.Num, "Last OK");

my mat4 $one-mat .= new;
ok($one-mat, "Declaration OK");
is($one-mat.mat.list[0],0, "Initialized OK");

my CArray[num32] $riller .= new( | (0..15).map: *.Num );

my $returned-mat = kmMat4Fill( $one-mat, $riller);
is $returned-mat.mat[0], 0.Num, "First one filled correctly";
is $returned-mat.mat[15], 15.Num, "Last one filled correctly";
my $expected =  q:to/EOT/;
|0 4 8 12|
|1 5 9 13|
|2 6 10 14|
|3 7 11 15|
EOT
$expected .= chomp;
is $returned-mat.gist, $expected,
 "Whole class";

