varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// ---------------------------------------------------------------------------------------------------
#region Init Variables
// ---------------------------------------------------------------------------------------------------

const float PI2 = 6.28318530718;
const float PI  = 3.14159265359;

uniform vec4	spriteUV;					// sprite texture map UVs (left, top, right, bottom)
uniform float	wobHeight;
uniform float	wobSize;
uniform float	wobOffset;
uniform float	wobHeight1;
uniform float	wobSize1;
uniform float	wobOffset1;
uniform float	wobHeight2;
uniform float	wobSize2;
uniform float	wobOffset2;

vec3 holeCol = vec3(0.);
vec3 outlineCol = vec3(1.);
float outlineRad = 0.02;
float holeRad = 1.;

#endregion
// ---------------------------------------------------------------------------------------------------

bool humpFill(float radius, float theta, float wobHeight, float wobSize, float wobOffset) {
    float theta2 = theta + PI2;
    return ((radius < ((-cos((theta-wobOffset)*wobSize)+1.)*wobHeight)+holeRad)
           && (wobOffset < theta)
           && (theta < (wobOffset + (PI2 / wobSize))))
           || ((radius < ((-cos((theta2-wobOffset)*wobSize)+1.)*wobHeight)+holeRad)
           && (wobOffset < theta2)
           && (theta2 < (wobOffset + (PI2 / wobSize))));
}

bool humpRegion(float theta, float wobSize, float wobOffset) {
    float theta2 = theta + PI2;
    return ((wobOffset < theta) && (theta < (wobOffset + (PI2 / wobSize))))
           || ((wobOffset < theta2) && (theta2 < (wobOffset + (PI2 / wobSize))));
}

float humpDist(float radius, float theta, float wobHeight, float wobSize, float wobOffset) {
	// Weird ass bug that only manifests with GMS
    float theta2 = theta + PI2;
	if (wobOffset > theta) {
		return ((-cos((theta2-wobOffset)*wobSize)+1.)*wobHeight)+holeRad - radius;
	} else {
		return ((-cos((theta-wobOffset)*wobSize)+1.)*wobHeight)+holeRad - radius;
	}
}

void main() {
	// Default output
	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// Normalize UVs on center
	vec2 uv = vec2((((v_vTexcoord.x - spriteUV[2]) / (spriteUV[0] - spriteUV[2]) - .5) * 2.),
				   (((v_vTexcoord.y - spriteUV[1]) / (spriteUV[3] - spriteUV[1]) - .5) * 2.));
				   
	// Polar Translation
	float theta			= mod(atan(uv.x, uv.y), PI2);
	float radius		= length(uv) * 2.;
	float wobOffsetNml	= mod(wobOffset, PI2);
	float wobOffsetNml1	= mod(wobOffset1, PI2);
	float wobOffsetNml2	= mod(wobOffset2, PI2);
	
	// Function
	if (humpFill(radius, theta, wobHeight, wobSize, wobOffsetNml) ||
	    humpFill(radius, theta, wobHeight1, wobSize1, wobOffsetNml1) ||
		humpFill(radius, theta, wobHeight2, wobSize2, wobOffsetNml2) ||
	    radius < holeRad) { 
		col = vec4(holeCol, 1.);
    }
	
	float dist = abs(radius - holeRad);
	if (humpRegion(theta, wobSize, wobOffsetNml)) {
        dist = humpDist(radius, theta, wobHeight, wobSize, wobOffsetNml);
    } else if (humpRegion(theta, wobSize1, wobOffsetNml1)) {
		dist = humpDist(radius, theta, wobHeight1, wobSize1, wobOffsetNml1);
	} else if (humpRegion(theta, wobSize2, wobOffsetNml2)) {
		dist = humpDist(radius, theta, wobHeight2, wobSize2, wobOffsetNml2);
	}
	
	col = mix(vec4(1.), col, smoothstep(outlineRad / 2., outlineRad, abs(dist)));
	
    gl_FragColor = col;
}
