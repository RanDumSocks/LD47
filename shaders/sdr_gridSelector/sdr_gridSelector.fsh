varying vec2 v_vTexcoord;
varying vec4 v_vColour;

#region init vars

uniform vec2 displaySize;	// Display size in pixels [x, y]

uniform float lineWidth;	// Line stoke
uniform float fade;			// Ammount in pixels at the end of the line which fades to alpha 0
uniform float fadePadding;	// Must be > lineWidth. Ammount of leeway from corner to remain opaque before fading

uniform vec2 point1;		// top-left coord [x, y]
uniform vec2 point2;		// bottom-right coord [x, y]

uniform vec3 customColor;	// color to draw grid in RGB

#endregion

#region vars setup for display

// Formatting the pixel point into screen percent
vec2 formatPoint1 = point1 / displaySize;
vec2 formatPoint2 = point2 / displaySize;
// Formatting ammounts to screen percentages for both axis
float lineWidthHori = lineWidth / displaySize.x;
float lineWidthVert = lineWidth / displaySize.y;
float fadeHori = fade / displaySize.x;
float fadeVert = fade / displaySize.y;
float fadePaddingHori = fadePadding / displaySize.x;
float fadePaddingVert = fadePadding / displaySize.y;
// Formatting colors to be uniform
float red = customColor.r / 256.0;
float green = customColor.g / 256.0;
float blue = customColor.b / 256.0;

#endregion

float fadeAlpha;

void main()
{
	// TODO: interpret what is going on here
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (v_vTexcoord.y < formatPoint1.y - fadePaddingVert){
		fadeAlpha = ((v_vTexcoord.y - formatPoint1.y + fadeVert + fadePaddingVert + lineWidthVert) / fadeVert);
	}
	else if (v_vTexcoord.y > formatPoint2.y + fadePaddingVert){
		fadeAlpha = ((((v_vTexcoord.y * -1.0) + fadeVert) + formatPoint2.y + lineWidthVert + fadePaddingVert) / fadeVert);
	}
	else if (v_vTexcoord.x < formatPoint1.x - fadePaddingHori){
		fadeAlpha = ((v_vTexcoord.x - formatPoint1.x + fadeHori + fadePaddingHori + lineWidthHori) / fadeHori);
	}
	else if (v_vTexcoord.x > formatPoint2.x + fadePaddingHori){
		fadeAlpha = ((((v_vTexcoord.x * -1.0) + fadeHori) + formatPoint2.x + lineWidthHori + fadePaddingHori) / fadeHori);
	}
	else
	{
		fadeAlpha = 1.0;	
	}
	
	if ((v_vTexcoord.y <= formatPoint1.y + lineWidthVert && v_vTexcoord.y >= formatPoint1.y - lineWidthVert) ||
		(v_vTexcoord.y <= formatPoint2.y + lineWidthVert && v_vTexcoord.y >= formatPoint2.y - lineWidthVert) ||
		(v_vTexcoord.x <= formatPoint1.x + lineWidthHori && v_vTexcoord.x >= formatPoint1.x - lineWidthHori) ||
		(v_vTexcoord.x <= formatPoint2.x + lineWidthHori && v_vTexcoord.x >= formatPoint2.x - lineWidthHori) ){
		gl_FragColor = vec4(red, green, blue, fadeAlpha);
	}
}
