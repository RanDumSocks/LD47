// ---------------------------------------------------------------------------------------------------
#region Variable Options
// ---------------------------------------------------------------------------------------------------

drawString	= "ERR";						// text to display
draw_x		= 0;							// text x pos
draw_y		= 0;							// text y pos
textColor	= c_black;						// text color
strokeWidth = 3;							// stroke thickness
strokeCol	= c_white;						// stroke color
strokeRes	= 32;							// accuracy of the stroke, higher for thinner text
drawFont	= f_sqair;						// text font
lineBreak	= room_width					// pixels before new line
fontSize	= 100;							// font size
gridPadding = 5;							// grid padding
centered	= true;							// if text is centered on draw_x and draw_y
lineSep		= 25;							// pixels between line breaks
rot			= 0;							// rotation TODO: format for center option
alpha		= 1;							// text alpha
hoverable	= true;							// whether the grid should be drawn over this isntance
scale		= 1;							// overall scale of surface
gridColor	= oc_gridSelector.defaultColor;	// color of the grid selector
customLines = false;						// when using \n characters, set this to true.

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Init Variables
// ---------------------------------------------------------------------------------------------------

postCreate		= true;

prevDrawString	= drawString;
prevStrokeCol	= strokeCol;
prevFontSize	= fontSize;

drawSurface		= noone;

mouseIn			= false;
clickTrigger	= true;

drawScale		= fontSize / 100;
breaks			= (string_height_ext(drawString, lineSep, lineBreak) - string_height(drawString)) /
					lineSep;
stringWidth		= string_width_ext(drawString, lineSep, lineBreak) * drawScale;
stringHeight	= (string_height(drawString) + (string_height(drawString) * breaks)) * drawScale;
centerAdj_x		= 0;
centerAdj_y		= 0;

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region
// ---------------------------------------------------------------------------------------------------

uni_fade		= shader_get_uniform(sdr_outline, "fade");
uni_checks		= shader_get_uniform(sdr_outline, "checks");
uni_stroke		= shader_get_uniform(sdr_outline, "stroke");
uni_texelH		= shader_get_uniform(sdr_outline, "texelH");
uni_texelW		= shader_get_uniform(sdr_outline, "texelW");
uni_strokeCol	= shader_get_uniform(sdr_outline, "strokeCol");

#endregion
// ---------------------------------------------------------------------------------------------------
