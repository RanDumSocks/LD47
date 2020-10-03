varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float direction;
uniform float amount;
uniform float texelWidth;
uniform float texelHeight;


vec2 pos = vec2(cos(direction) * amount * texelWidth, sin(direction) * amount * texelHeight);

const int Quality = 32;

void main() {
   vec4 Color;
   for (float i = 0.0; i < 1.0; i += 1.0 / float(Quality))  {
      Color += texture2D (gm_BaseTexture, v_vTexcoord + (pos) * i);
   }
   Color /= float(Quality);
   gl_FragColor = Color * v_vColour;
}