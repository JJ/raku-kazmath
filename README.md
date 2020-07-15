# kazmath

This is an embryo of a NativeCall port of the [kazmath library](https://github.com/Kazade/kazmath).

kazmath is low-level library for manipulation of graphics primitives. It's
 similar to others graphics libraries such as OpenGL, but it's simpler and
 , in some cases, faster. 

## Installing

You need to install kazmath from source (URL above), compiling it. Follow the
 instructions to create a shared library.
 
 Then you xan install this from this source or via
 
    zef install kazmath

## Running

Since only some functions have been ported, basically you can rotate a vector
, like this:

```raku
    my mat4 $one-mat .= new;
    my mat4 $turn-pi = kmMat4RotationY($one-mat, pi/2);
    say $turn-pi;
    my vec4 $out .= new;
    my vec4 $in  .= new(1.Num, 0.Num, 0.Num, 1.Num);
    my vec4 $result = kmVec4Transform( $out, $in, $turn-pi);
    say $result;
```

## See also

Tutorial for [NativeCall](https://docs.raku.org/language/nativecall)

Also, this has been built mainly to be used as a recipe in the upcoming Raku
 Recipes book by APress. Check out all [Raku titles in Apress such as this one.
 ](https://www.apress.com/gp/book/9781484249550)
 
If you want to create a Dockerfile with `kazmath`, check out the [`download-and-compile-kazmath.sh`](download-and-compile-kazmath.sh) included in this repo.

## License
 
This module is licensed under the Artistic 2.0 License (the same as Raku itself
)
