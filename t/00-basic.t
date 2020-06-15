use Test;

use kazmath;
use NativeCall;

is( kmSQR( 2.Num ),4, "Simple function works");
is-approx( kmDegreesToRadians(kmRadiansToDegrees(2.Num)),2, "Return values OK");
done-testing;


subtest "Vec4", {
    my vec4 $out .= new;
    is($out.x, 0.Num, "First OK");
    my vec4 $v .= new(|(1.Num xx 4));
    is($v.x, 1.Num, "First OK");
    is($v.w, 1.Num, "Last OK");
    my vec4 $in .= new(1.Num, 0.Num, 0.Num, 1.Num);
    my vec4 $result = kmVec4Scale($out, $in, 2.Num);
    is($result.x, 1.4142135381698608, "Scaling OK");
}

subtest "Mat4", {
    my mat4 $one-mat .= new;
    ok($one-mat, "Declaration OK");
    is($one-mat.mat.list[0],0, "Initialized OK");
    my mat4 $result = kmMat4Identity( $one-mat );
    is $result.mat[0], 1.Num, "Identity OK";

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
    is $returned-mat.gist, $expected, "Whole class";
}

subtest "Rotation X", {
    my mat4 $one-mat .= new;
    my $turn-pi = kmMat4RotationX($one-mat, pi/2);
    my mat4 $two-mat .= new;
    my $return-pi = kmMat4RotationX($two-mat, -pi/2);
    is $turn-pi.mat[6], -$return-pi.mat[6], "Rotates X OK";
    my vec4 $out .= new;
    my vec4 $in  .= new(1.Num, 0.Num, 0.Num, 1.Num);
    my vec4 $result = kmVec4Transform( $out, $in, $turn-pi);
};

subtest "Rotation Y", {
    my mat4 $one-mat .= new;
    my $turn-pi = kmMat4RotationY($one-mat, pi/2);
    my mat4 $two-mat .= new;
    my $return-pi = kmMat4RotationY($two-mat, -pi/2);
    is $turn-pi.mat[2], -$return-pi.mat[2], "Rotates Y OK";
};

subtest "Rotation Z", {
    my mat4 $one-mat .= new;
    my $turn-pi = kmMat4RotationZ($one-mat, pi);
    my mat4 $two-mat .= new;
    my $return-pi = kmMat4RotationZ($two-mat, -pi);
    is $turn-pi.mat[1], -$return-pi.mat[1], "Rotates Z OK";
};

