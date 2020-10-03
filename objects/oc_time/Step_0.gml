// ---------------------------------------------------------------------------------------------------
#region Maintain animation speed to FPS
// ---------------------------------------------------------------------------------------------------

if (os_get_config() == "debug") {
	global.second = 1 / room_speed	// Always perfect speed
} else {
	global.second = min(delta_time / 1000000, 2 / room_speed)
}

#endregion
// ---------------------------------------------------------------------------------------------------

// Time since creation tracker
global.secondsPassed += global.second