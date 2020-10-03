function loadJSONFromFile(filename) {

	var buffer = buffer_load(filename);
	var _string = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);

	var json = json_decode(_string);
	return json;


}

/// @desc Saves a string to a file specified in working directory
/// @arg filename
/// @arg string
function saveStringToFile(filename, jsonString) {

	var _buffer = buffer_create(string_byte_length(jsonString) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, jsonString);
	buffer_save(_buffer, filename);
	buffer_delete(_buffer);


}

function debugMsg(msg) {
   show_debug_message(msg);
}

function smoothVar() {

	// ---------------------------------------------------------------------------------------------------
   #region Get Variables
	// ---------------------------------------------------------------------------------------------------

	var variable	= argument[0];
	var targetValue = argument[1];
	var speedFactor = argument[2];

	if (argument_count == 4) {
		var minChange = argument[3];
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region Variable Checks
	// ---------------------------------------------------------------------------------------------------

	if (is_array(variable)) {
		var isArray = true;
		var arrayLength = array_length_1d(variable);
		var returnArray;
	} else {
		var isArray = false;
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region Function
	// ---------------------------------------------------------------------------------------------------

	if (isArray) {
		for (var i = 0; i < arrayLength; i++) {
			returnArray[i] = (targetValue[i] - variable[i]) / (speedFactor / global.second);
		}
		return returnArray;
	} else {
		var diff = targetValue - variable;
		var adjustment = diff / (speedFactor / global.second);
		if (argument_count == 4) {
			if (diff > 0 && adjustment < minChange * global.second) {
				adjustment = minChange * global.second;
				if (adjustment - diff > 0) {
					adjustment = diff;	
				}
			} else if (diff < 0 && adjustment > -minChange * global.second) {
				adjustment = -minChange * global.second;
				if (adjustment - diff < 0) {
					adjustment = diff;	
				}
			}
		}
		return adjustment;
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


}

function formatNumber() {
   #region init vars

	value = argument[0];

   #endregion

	// MAX integer overflow 2^62 base 10 ~18.6

	/*
	postFix = -1;
	postFixDict = ["K", "M", "B", "T", "Qa", "Qi"];
	digitsK = floor(ceil(log10(value) - 2) / 3);
	if (digitsK >= 1) {
		postFix = digitsK - 1;
		value /= round(power(10, digitsK * 3));
	}
	*/

	valueString = string(value);
	//if (postFix == -1) {
		for (var i = string_length(valueString); i >= 4; i -= 3) {
			valueString = string_insert(",", valueString, i - 2);
		}
	/*} else {
		valueString = string_format(value, string_length(valueString) - 3, 2);
		for (var i = string_length(valueString) - 3; i >= 4; i -= 3) {
			valueString = string_insert(",", valueString, i - 2);
		}	

	}

	postFixAppend = "";
	if (postFix != -1) {
		postFixAppend = postFixDict[postFix];	
	}
	*/
	//return valueString + postFixAppend;
	return valueString


}


/// @param pos_x
/// @param pos_y
/// @param sprite
/// @param scale
/// @param padding
/// @param rotation
/// @param viewNum
function gridSelectorPoints() {

	/*
	 * Determines the points to pass into oc_gridSelector.
	 *
	 * if no arguments are passed in, it sets oc_gridSelector.hovering to false
	 * to reset the points back to the mouse.
	 *
	 * Accepts 7 arguments (pos_x, pos_y, sprite, scale, padding, rotation, viewNum) where 'sprite'
	 * is a valid sprite index. the pos variables refer to the sprite origin. This
	 * script only works if it is called in a room with cont_grisSelector in it.
	 *
	 * Use -1 for viewNum if object is on the GUI.
	 */

	// ---------------------------------------------------------------------------------------------------
   #region Check Constructor
	// ---------------------------------------------------------------------------------------------------

	if (!(argument_count == 0 || argument_count == 7)) {
		show_error("Invalid constructor passed", true);
	}

	if (argument_count == 7) {
		if (!is_real(argument[0]) || !is_real(argument[1]) || !sprite_exists(argument[2]) ||
			  !is_real(argument[3]) || !is_real(argument[4]) || !is_real(argument[5]) ||
			  !is_real(argument[6])){
			show_error("Invalid constuctor arguments passed." + 
					   " Expected (real, real, Sprite ID (int), real, real, real) got ("+
					   string(argument[0]) + ", " + string(argument[1]) + ", " +
					   string(argument[2]) + ", " + string(argument[3]) + ", " +
					   string(argument[4]) + ", " + string(argument[5]) + ", " +
					   string(argument[6]) + ")", true);
		}
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region init vars
	// ---------------------------------------------------------------------------------------------------

	if (argument_count != 0) {
		var pos_x		= argument[0];
		var pos_y		= argument[1];
		var sprite		= argument[2];
		var scale		= argument[3];
		var padding		= argument[4];
		var rotation	= (argument[5] * (pi / 180)) mod (2 * pi);
		var viewNum		= argument[6];
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region gridSelectorPoints();
	// ---------------------------------------------------------------------------------------------------

	if (argument_count == 0) {
		oc_gridSelector.hovering = false;
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region gridSelectorPoints(pos_x, pos_y, sprite, scale, padding);
	// ---------------------------------------------------------------------------------------------------

	// NOTE: If there is any problem with negative scale, subtract width / height from formula.
	//       Too lazy to fix them all right now.
	if (argument_count != 0) {
		var spriteOffset_x = sprite_get_xoffset(sprite);
		var spriteOffset_y = sprite_get_yoffset(sprite);

		var spriteWidth = sprite_get_width(sprite);
		var spriteHeight = sprite_get_height(sprite);
	
		if (viewNum == -1) {
			var view_x = device_mouse_x_to_gui(0);
			var view_y = device_mouse_y_to_gui(0);
		
			if (scale <= 0) {
				scale *= -1;
				oc_gridSelector.point1 =
					[pos_x - (spriteWidth - (spriteOffset_x * scale)) - padding,
					(pos_y - (spriteOffset_y * scale)) - padding];
								  
				oc_gridSelector.point2 =
					[(pos_x + ((spriteWidth - spriteOffset_x) * scale)) + padding - (spriteWidth * scale),
					(pos_y + ((spriteHeight - spriteOffset_y) * scale)) + padding];
			} else {
				oc_gridSelector.point1 =
					[(pos_x - (spriteOffset_x * scale)) - padding,
					(pos_y - (spriteOffset_y * scale)) - padding];
								  
				oc_gridSelector.point2 =
					[(pos_x + ((spriteWidth - spriteOffset_x) * scale)) + padding,
					(pos_y + ((spriteHeight - spriteOffset_y) * scale)) + padding];
			}
		} else {
			var view_x = camera_get_view_x(view_camera[viewNum]);
			var view_y = camera_get_view_y(view_camera[viewNum]);
	
			if (rotation == 0) {
				if (scale <= 0) {
					scale *= -1;
					oc_gridSelector.point1 =
					  [(pos_x - (spriteOffset_x * scale)) - padding - view_x - (spriteOffset_y * scale),
					  (pos_y - (spriteOffset_y * scale)) - padding - view_y];
								  
					oc_gridSelector.point2 =
					  [(pos_x + ((spriteWidth - spriteOffset_x) * scale)) + padding - view_x - (spriteWidth * scale),
					  (pos_y + ((spriteHeight - spriteOffset_y) * scale)) + padding - view_y];
				} else {
					oc_gridSelector.point1 =
					  [(pos_x - (spriteOffset_x * scale)) - padding - view_x,
					  (pos_y - (spriteOffset_y * scale)) - padding - view_y];
								  
					oc_gridSelector.point2 =
					  [(pos_x + ((spriteWidth - spriteOffset_x) * scale)) + padding - view_x,
					  (pos_y + ((spriteHeight - spriteOffset_y) * scale)) + padding - view_y];
				}

			} else {
				if (rotation < 0) {
					rotation = (2 * pi) + rotation;	
				}
	
				if (scale <= 0) {
					scale *= -1;
					oc_gridSelector.point1 =
					  [(pos_x - (spriteOffset_x * scale)) - padding - view_x - (spriteWidth * scale),
					  (pos_y - (spriteOffset_y * scale)) - padding - view_y];
		  
					oc_gridSelector.point2 =
					  [(pos_x + ((spriteWidth - spriteOffset_x) * scale)) + padding - view_x - (spriteWidth * scale),
					  (pos_y + ((spriteHeight - spriteOffset_y) * scale)) + padding - view_y];
				} else {
		
					if ((rotation + (pi / 2)) mod (2 * pi) < pi) {
						pt1Translate[1] =
						  (spriteOffset_x * abs(sin(rotation))) + (spriteOffset_y * cos(rotation));
						pt2Translate[1] =
						  ((spriteWidth - spriteOffset_x) * abs(sin(rotation))) +
						    ((spriteHeight - spriteOffset_y) * cos(rotation))
					} else {
						pt1Translate[1] =
						  ((spriteWidth - spriteOffset_x) * abs(sin(rotation))) +
						    ((spriteHeight - spriteOffset_y) * cos(rotation));
						pt2Translate[1] =
						  (spriteOffset_x * abs(sin(rotation))) + (spriteOffset_y * -cos(rotation));
					}
		
					if((rotation) mod (2 * pi) < pi) {
						pt1Translate[0] =
						  (spriteOffset_x * abs(cos(rotation))) + (spriteOffset_y * sin(rotation));
						pt2Translate[0] =
						  ((spriteWidth - spriteOffset_x) * abs(cos(rotation))) +
						    ((spriteHeight - spriteOffset_y) * sin(rotation));
					} else {
						pt1Translate[0] =
						  ((spriteWidth - spriteOffset_x) * abs(cos(rotation))) +
						    ((spriteHeight - spriteOffset_y) * sin(rotation));
						pt2Translate[0] =
						  (spriteOffset_x * abs(cos(rotation))) + (spriteOffset_y * -sin(rotation))
					}
		
					oc_gridSelector.point1 =
					  [(pos_x - (pt1Translate[0] * scale)) - padding - view_x,
					  (pos_y - (pt1Translate[1] * scale)) - padding - view_y];
					oc_gridSelector.point2 =
					  [(pos_x + (pt2Translate[0] * scale)) + padding - view_x,
					  (pos_y + (pt2Translate[1] * scale)) + padding - view_y];
				}
			}
			oc_gridSelector.point1[0] /= camera_get_view_width(view_camera[viewNum]) / global.resWidth;
			oc_gridSelector.point2[0] /= camera_get_view_width(view_camera[viewNum]) / global.resWidth;

			oc_gridSelector.point1[1] /= camera_get_view_height(view_camera[viewNum]) / global.resHeight;
			oc_gridSelector.point2[1] /= camera_get_view_height(view_camera[viewNum]) / global.resHeight;
		}
		oc_gridSelector.hovering = true;
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


}

/// @desc Adds two equal size 1D arrays together.
///       Arrays must be equal in length.
/// @param arr1 initial array
/// @param arr2 array to add to arr1
function addArray(argument0, argument1) {

   #region init vars

	var arr1 = argument0;
	var arr2 = argument1;

	if (!(is_array(arr2) || is_array(arr2))) {
		show_error("Value was not an array.", true);
	}

	var length = array_length_1d(arr1);

	if (array_length_1d(arr2) != length) {
		show_error("Array lengths not equal.", true);
	}

   #endregion

   #region function

	for (var i = 0; i < length; i++) {
		arr1[i] += arr2[i];
	}
	return arr1;

   #endregion


}
