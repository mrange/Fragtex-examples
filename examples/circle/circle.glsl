// CC0: A bouncing circle

// This file is released under CC0 1.0 Universal (Public Domain Dedication).
// To the extent possible under law, mrange has waived all copyright
// and related or neighboring rights to this work.
// See <https://creativecommons.org/publicdomain/zero/1.0/> for details.

precision highp float;
uniform vec2 resolution;
uniform float time;
out vec4 FC;

void main() {
  vec2
    C=gl_FragCoord.xy
  , r=resolution
  , p=(C+C-r)/r.y
  ;
  float
    aa=sqrt(2.)/r.y
  , b =fract(time)-.5
  , d
  ;
  b*=b;
  p.y+=b;
  d=length(p)-.5;
  FC=vec4((vec3(1,0,.25)+sqrt(max(-d,0.)))*smoothstep(aa,-aa,d),1);
}

