use NativeCall;

unit module kazmath;

class mat4 is repr('CStruct') {
    has num32 $.mat[16];
}

sub kmSQR( num32 $s ) returns num32 is native('kazmath') is export {*}
sub kmRadiansToDegrees( num32 $radians) returns num32 is native('kazmath') is
export {*}
sub kmDegreesToRadians( num32 $radians) returns num32 is native('kazmath') is
export {*}

sub kmMat4Fill( mat4 $math, num32 $filler ) returns mat4 is native('kazmath')
                                            is export {*}