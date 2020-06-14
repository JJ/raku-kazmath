use NativeCall;

unit module kazmath;

class mat4 is repr('CStruct') {
    has CArray[num32] $!mat;
}

sub kmSQR( num32 $s ) returns num32 is native('kazmath') is export {*}
sub kmRadiansToDegrees( num32 $radians) returns num32 is native('kazmath') is
export {*}
sub kmDegreesToRadians( num32 $radians) returns num32 is native('kazmath') is
export {*}

sub kmMat4Fill( mat4 $mat, num32 @filler ) returns mat4 is native('kazmath')
                                            is export {*}