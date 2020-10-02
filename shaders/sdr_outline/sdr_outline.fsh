// ---------------------------------------------------------------------------------------------------
#region Init Variables
// ---------------------------------------------------------------------------------------------------

varying vec2  v_vTexcoord;
varying vec4  v_vColour;
varying vec3  v_vPosition;

uniform float fade;
uniform float checks;
uniform float stroke;
uniform float texelH;
uniform float texelW;
uniform vec3  strokeCol;

const float   PI = 3.1415926535897932384626433832795;
const float   EPSILON = 0.005;

float deltaTheta = (2.0 * PI) / checks;
vec2 offset;
float maxAlpha = 0.0;
bool edgeFound = false;

#endregion
// ---------------------------------------------------------------------------------------------------

void main() {
	
	vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	for (float i = 0.0; i <= (2.0 * PI); i += deltaTheta) {
		offset.x = cos(i) * texelW * stroke;
		offset.y = sin(i) * texelH * stroke;
		vec4 testCoord = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
		if (testCoord.a >= EPSILON) {
			edgeFound = true;
			if (testCoord.a > maxAlpha) {
				maxAlpha = 	testCoord.a;
			}
		}
	}
	
	if (col.a < (fade - EPSILON) && edgeFound) {
		col = mix(vec4(strokeCol.r, strokeCol.g, strokeCol.b, fade), col, col.a);
		col.a = maxAlpha;
	}
	
	gl_FragColor = col;
}
