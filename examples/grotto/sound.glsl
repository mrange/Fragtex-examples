precision highp float;
uniform vec2  resolution;
uniform float startSample;
uniform float sampleRate;
out vec4 FC;

const float
  tau=2.*acos(-1.)
;

vec2 music(float t) {
  vec2 ret;
  for(float i=1.;i<4.;i++)
  for(float j=1.;j<5.;j++) {
    float r = t*j/32.+i/3.,
               v = mod(r,1.),
               a=3.;
    vec2 m, s = vec2(t,t+3.)+t/j;
    for (int i=0;i<16;i++)
      m += sin(s*a)/a,s += a *= 1.02;
    if(r<9.)
      ret += sin(m+4.*sin(t/j/47.)*sin(exp2(mod(r-v,3.)/6.+8.5)*t*j*i+i+j))*exp2(-v*12.-1./v+6.-i/3.-j/3.);
  }
  return vec2(ret);
}


void main() {
  vec2
    C=gl_FragCoord.xy
  ;
  float
    t=(startSample+C.x+C.y*resolution.x)/sampleRate
  ;

  FC=vec4(music(t),0,1);
}
