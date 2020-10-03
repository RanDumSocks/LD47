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