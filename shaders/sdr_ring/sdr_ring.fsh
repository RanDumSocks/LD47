varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// ---------------------------------------------------------------------------------------------------
#region TextHere
// ---------------------------------------------------------------------------------------------------

uniform vec4  spriteUV;
uniform vec2  origin;
uniform vec2  displaySize;	// Display size in pixels [x, y]
uniform float lineWidth;	// Line stoke
uniform vec3  customColor;	// color to draw grid in RGB
uniform float radius;      // Raduis of the circle
uniform float ratio;
uniform float wobble;
uniform float period;

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Vars Setup
// ---------------------------------------------------------------------------------------------------

// Formatting colors to be uniform
float red = customColor.r / 256.0;
float green = customColor.g / 256.0;
float blue = customColor.b / 256.0;

#endregion
// ---------------------------------------------------------------------------------------------------


void main() {
   gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
   
   vec2 uv = vec2((v_vTexcoord.x - spriteUV[0]) / (spriteUV[2] - spriteUV[0]),
                  ((v_vTexcoord.y - spriteUV[3]) / (spriteUV[1] - spriteUV[3])));
   
   float amp = (-abs(uv.x - 0.5) + 0.45);
   if (amp < 0.) { amp = 0.; }
   float dist = pow(pow(uv.x - origin.x, 2.) + pow(uv.y - origin.y, 2.), 0.5) + (sin((amp * 150.) + period) * wobble * (amp * 32.));
   if (dist > radius - lineWidth && dist < radius + lineWidth) {
      gl_FragColor = vec4(red, green, blue, 1.0);
   } else if (dist > radius - lineWidth) {
      gl_FragColor = vec4(0., 0., 0., 1.0);
   }
}
