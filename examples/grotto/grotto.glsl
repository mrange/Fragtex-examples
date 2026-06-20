precision highp float;
uniform vec2 resolution;
uniform float time;
out vec4 FC;

#define iTime       time
#define iResolution vec3(resolution,1)

void mainImage(out vec4 O, vec2 C);

void main() {
  vec4 O = vec4(0);
  mainImage(O, gl_FragCoord.xy);
  FC = O;
}

void mainImage(out vec4 o,vec2 C) {
  float i,d,z,s,Z,t=iTime;
  vec4 O,U=vec4(2,1,0,3);
  for (
      vec2 r=iResolution.xy
    ; ++i<79.
    ; o.y=abs(s=o.y+.1)
    )
      o.y-=.11
    , o.xy*=mat2(cos(11.*U.zywz-2.*o.z))
    , o.y-=.2
    , z+=d=5E-4+abs(abs(dot(sin(o*=8.),cos(o.zxwy))-1.)-abs(dot(sin(o*=3.),cos(o.zxwy))-1.)/3.)/32.
    , o=1.+cos(.7*U+5.*Z)
    , O+=(s<0.?d*=d*d,.1:1.)*o.w/max(d,5E-4)*o
    , o=vec4(z*normalize(vec3(C-.5*r,r.y)),.2)
    , Z=o.z+=t/3E1
    ;

  O+=(1.4+sin(t)*sin(t/.6)*sin(t/.4))*1E3/length(o.xy)*U;

  o=tanh(O/8E4);
}


