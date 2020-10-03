// ---------------------------------------------------------------------------------------------------
#region Mouse Position Update
// ---------------------------------------------------------------------------------------------------

var mx = (window_mouse_get_x() / (window_get_width() / global.resWidth));
var my = (window_mouse_get_y() / (window_get_height() / global.resHeight));

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region State Switching
// ---------------------------------------------------------------------------------------------------

// TODO: Create proper state machine

if (mouse_check_button(mb_left)){
	if (!hovering) {
		mousePadding = mousePaddingDown;
		padding		+= smoothVar(padding, fadePaddingDown, speedFactor);
	}
	else {
		padding += smoothVar(padding, fadePaddingDownHovering, speedFactor);
	}
}
else {
	mousePadding = mousePaddingUp;
	padding		+= smoothVar(padding, fadePaddingUp, speedFactor);
}


if (!hovering) {
	point1 = [mx - mousePadding, my - mousePadding];
	point2 = [mx + mousePadding, my + mousePadding];
	
	if (speedFactor > minSpeedFactor){
		speedFactor -= speedFactor_dx * global.second;
	}
	
	lineWidth += smoothVar(lineWidth, lineWidthIdle, speedFactor);
	fade	  += smoothVar(fade, fadePaddingIdle, speedFactor);
}
else {
	speedFactor = speedFactorHover;
	lineWidth  += smoothVar(lineWidth, lineWidthHover, speedFactor);
	fade	   += smoothVar(fade, fadePaddingHover, speedFactor);
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Point & Color Updating
// ---------------------------------------------------------------------------------------------------

if (speedFactor <= minSpeedFactor && !hovering) {
	point1Grid = [mx - mousePadding, my - mousePadding];
	point2Grid = [mx + mousePadding, my + mousePadding];
} else {
	point1Grid[0] += smoothVar(point1Grid[0], point1[0], speedFactor);
	point1Grid[1] += smoothVar(point1Grid[1], point1[1], speedFactor);
	point2Grid[0] += smoothVar(point2Grid[0], point2[0], speedFactor);
	point2Grid[1] += smoothVar(point2Grid[1], point2[1], speedFactor);
}

color = addArray(color, smoothVar(color, customColor, color_dx));
#endregion
// ---------------------------------------------------------------------------------------------------