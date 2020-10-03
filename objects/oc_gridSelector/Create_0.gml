/*
 * Final control for the grid variables before being passed into the GPU. Processses points and adds
 * padding and other settings to the grid depeding on the state.
 */

// ---------------------------------------------------------------------------------------------------
#region Variable Options
// ---------------------------------------------------------------------------------------------------

// NOTE: line width variables are 2x in shader calculations (basically pixels from center)

mousePaddingUp			= 4;
mousePaddingDown		= 7;
fadePaddingUp			= 0;
fadePaddingDown			= 0.02;
fadePaddingIdle			= 0.02;
fadePaddingHover		= 25;
fadePaddingDownHovering = 26;
lineWidthIdle			= 1;
lineWidthHover			= 2;
speedFactorHover		= 0.07;

minSpeedFactor			= 0.02;
speedFactor_dx			= 0.2;
color_dx				= 0.08;	

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Public Controls
// ---------------------------------------------------------------------------------------------------

hovering	= false;						// if over supported object
customColor = undefined;					// color of grid

/* Object corners */
point1		= [0, 0];						// top-left corner
point2		= [window_get_width(), window_get_height()];	// bottom-right corner

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Init Variables
// ---------------------------------------------------------------------------------------------------

gridSelectorSurf	= surface_create(window_get_width(), window_get_height());

speedFactor			= minSpeedFactor;
lineWidth			= lineWidthIdle;
fade				= fadePaddingIdle;
mousePadding		= mousePaddingUp;
padding				= fadePaddingIdle;

defaultColor		= [255, 255, 255];		// READ-ONLY, default grid color
color				= defaultColor;			// current color of grid
customColor			= defaultColor;			// color to animate grid to

point1Grid = [mouse_x - mousePaddingUp, mouse_y - mousePaddingUp];
point2Grid = [mouse_x + mousePaddingUp, mouse_y + mousePaddingUp];

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Shader Uniforms
// ---------------------------------------------------------------------------------------------------

uni_displaySize = shader_get_uniform(sdr_gridSelector, "displaySize");
uni_lineWidth	= shader_get_uniform(sdr_gridSelector, "lineWidth");
uni_fade		= shader_get_uniform(sdr_gridSelector, "fade");
uni_fadePadding = shader_get_uniform(sdr_gridSelector, "fadePadding");
uni_point1		= shader_get_uniform(sdr_gridSelector, "point1");
uni_point2		= shader_get_uniform(sdr_gridSelector, "point2");
uni_color		= shader_get_uniform(sdr_gridSelector, "customColor");

#endregion
// ---------------------------------------------------------------------------------------------------

//set cursor sprite (must be in init room so it's here)
window_set_cursor(cr_none);
cursor_sprite = sp_cursor;