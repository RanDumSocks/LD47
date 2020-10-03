// ---------------------------------------------------------------------------------------------------
#region Update Changed Options for Inheritance
// ---------------------------------------------------------------------------------------------------

if (postCreate) {
	postCreate = false;
	draw_set_font(drawFont);
	fontPixelSize = string_height(drawString);
	drawScale = fontSize / fontPixelSize;
	lineBreak /= drawScale;
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Update Dynamic Variables
// ---------------------------------------------------------------------------------------------------

draw_set_font(drawFont);
drawScale		= fontSize / fontPixelSize;
breaks			= (string_height_ext(drawString, lineSep, lineBreak) - string_height(drawString))
					/ lineSep;
if (customLines) {
	stringHeight = string_height(drawString) * drawScale;
	stringWidth = string_width(drawString) * drawScale;
} else {
	stringHeight	= (string_height(drawString) + (string_height(drawString) * breaks)) * drawScale;
	stringWidth		= string_width_ext(drawString, lineSep, lineBreak) * drawScale;
}

if (centered) {
	centerAdj_x = stringWidth / 2;
	centerAdj_y = stringHeight / 2;
	scaleAdj_x	= (stringWidth / 2) * abs(scale - 1);
	scaleAdj_y	= (stringHeight / 2) * abs(scale - 1);
	bbox_x		= ((stringWidth - (stringWidth * scale)) / 2);
	bbox_y		= ((stringHeight - (stringHeight * scale)) / 2);
} else {
	centerAdj_x = 0;
	centerAdj_y = 0;
	scaleAdj_x	= 0;
	scaleAdj_y	= 0;
	bbox_x		= 0;
	bbox_y		= 0;
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Mouse Detection
// ---------------------------------------------------------------------------------------------------

if (hoverable) {
	if (point_in_rectangle(mouse_x, mouse_y,
						   draw_x - centerAdj_x + bbox_x,
						   draw_y - centerAdj_y + bbox_y,
						   draw_x + stringWidth - centerAdj_x - bbox_x,
						   draw_y + stringHeight - centerAdj_y - bbox_y)) {
		oc_gridSelector.customColor = gridColor;
		oc_gridSelector.hovering	= true;
		oc_gridSelector.point1		= [(draw_x - gridPadding - centerAdj_x + bbox_x) * (800/400),
									   (draw_y - gridPadding - centerAdj_y + bbox_y) * (800/400)];
		oc_gridSelector.point2		= [(draw_x + stringWidth + gridPadding - centerAdj_x - bbox_x) * (800/400),
									   (draw_y + stringHeight + gridPadding - centerAdj_y - bbox_y) * (800/400)];
		mouseIn = true;
	} else if (mouseIn) {
		oc_gridSelector.customColor = oc_gridSelector.defaultColor;
		mouseIn = false;
		gridSelectorPoints();
	}
} else if (mouseIn) {
	oc_gridSelector.customColor = oc_gridSelector.defaultColor;
	mouseIn = false;
	gridSelectorPoints();
}

#endregion
// ---------------------------------------------------------------------------------------------------


// ---------------------------------------------------------------------------------------------------
#region Click Detection
// ---------------------------------------------------------------------------------------------------

if (mouseIn && !mouse_check_button(mb_left) && clickTrigger) {
	clickTrigger = false;
	event_user(5);
}

if (mouse_check_button(mb_left)) {
	clickTrigger = true;
} else {
	clickTrigger = false;
}

#endregion
// ---------------------------------------------------------------------------------------------------