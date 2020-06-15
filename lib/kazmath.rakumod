use NativeCall;

unit module kazmath;

class vec4 is repr('CStruct') is export {
    has num32 $.x;
    has num32 $.y;
    has num32 $.z;
    has num32 $.w;

    method new( $x = 0.Num, $y=0.Num, $z=0.Num, $w = 1.Num ) {
        self.bless( :$x, :$y, :$z, :$w )
    }

    submethod BUILD ( :$!x, :$!y, :$!z, :$!w) { }
}

our $vec4-x = vec4.new( 1.Num, 0.Num, 0.Num, 1.Num);
our $vec4_y = vec4.new( 0.Num, 1.Num, 0.Num, 1.Num);
our $vec4_z = vec4.new( 0.Num, 0.Num, 1.Num, 1.Num);

sub kmVec4Scale(vec4 $pOut, vec4 $pIn, num32 $s)
        returns vec4 is native('kazmath') is export {*}

class mat4 is repr('CStruct') is export {
    HAS num32 @.mat[16] is CArray;

    submethod BUILD( :@mat = 0.Num xx 16) {
        for ^16 {
            @!mat[$_] = @mat[$_];
        }
    }

    method gist() {
        my @arr;
        my $index = 0;
        for ^16 {
            my $index = ($_ % 4 ) * 4 + ($_ div 4 );
            @arr.append: @!mat[$index];
        }
        return (@arr.rotor(4).map: "|" ~ *.join(" ") ~ "|").join("\n")
    }
}

sub kmSQR( num32 $s ) returns num32 is native('kazmath') is export {*}
sub kmRadiansToDegrees( num32 $radians) returns num32 is native('kazmath') is
export {*}
sub kmDegreesToRadians( num32 $radians) returns num32 is native('kazmath') is
export {*}

sub kmMat4Fill( mat4 $mat, CArray[num32] $filler )
        returns mat4 is native('kazmath') is export {*}

sub kmMat4RotationX(mat4 $mat, num32 $radians)
    returns mat4 is native('kazmath') is export {*}

sub kmMat4RotationY(mat4 $mat, num32 $radians)
        returns mat4 is native('kazmath') is export {*}

sub kmMat4RotationZ(mat4 $mat, num32 $radians)
        returns mat4 is native('kazmath') is export {*}

sub kmMat4Identity(mat4 $pOut)
        returns mat4 is native('kazmath') is export {*}

sub kmVec4Transform(vec4 $pOut, vec4 $pV,
                    mat4 $pM)
        returns vec4 is native('kazmath') is export {*}

