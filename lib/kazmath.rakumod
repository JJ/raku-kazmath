use NativeCall;

unit module kazmath;

our class mat4 is repr('CStruct') is export {
    HAS num32 @.mat[16] is CArray;

    submethod BUILD( :@mat = 0.Num xx 16) {
        for ^16 {
            @!mat[$_] = @mat[$_];
        }
    }
}

sub kmSQR( num32 $s ) returns num32 is native('kazmath') is export {*}
sub kmRadiansToDegrees( num32 $radians) returns num32 is native('kazmath') is
export {*}
sub kmDegreesToRadians( num32 $radians) returns num32 is native('kazmath') is
export {*}

sub kmMat4Fill( mat4 $mat, CArray[num32] $filler )
        returns mat4 is native('kazmath') is export {*}