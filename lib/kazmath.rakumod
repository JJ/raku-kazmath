use NativeCall;

unit module kazmath;

class vec4 is repr('CStruct') is export {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    has num32 $.w;

    method new( $x, $y, $z, $w ) {
        self.bless( :$x, :$y, :$z, :$w )
    }

    submethod BUILD ( :$!x, :$!y, :$!z, :$!w) { }
}

class mat4 is repr('CStruct') is export {
    HAS num32 @.mat[16] is CArray;

    submethod BUILD( :@mat = 0.Num xx 16) {
        for ^16 {
            @!mat[$_] = @mat[$_];
        }
    }

    method gist() {
        my @arr;
        for ^16 {
            @arr.append: @!mat[$_];
        }
        return "[{@arr.join(", ")}]";
    }
}

sub kmSQR( num32 $s ) returns num32 is native('kazmath') is export {*}
sub kmRadiansToDegrees( num32 $radians) returns num32 is native('kazmath') is
export {*}
sub kmDegreesToRadians( num32 $radians) returns num32 is native('kazmath') is
export {*}

sub kmMat4Fill( mat4 $mat, CArray[num32] $filler )
        returns mat4 is native('kazmath') is export {*}