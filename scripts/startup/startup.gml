function startup(){
	// ---------------------------------------------------------------------------------------------------
   #region Load Settings 
	// ---------------------------------------------------------------------------------------------------

	// default option values
	global.savResolution = 3;
	global._fps = 3;
	global.fullscreen = false;
	global.interpolation = false;

	var optionsFound = file_exists("options.sav");

	if (optionsFound) {
		var wrapper = loadJSONFromFile("options.sav");
	
		// set option values to loaded values
		global.savResolution = wrapper[? "resolution"];
		global._fps = wrapper[? "fps"];
		global.fullscreen = wrapper[? "fullscreen"];
		global.interpolation = wrapper[? "interpolation"];
	
		// decode resolution indexes
		if (global.savResolution == undefined || global.savResolution > 5) {
			global.savResolution = 5;
		}
		switch (global.savResolution) {
			case 0:
				var resolution = 576;
				var ratio = 16 / 9;
				break;
			case 1:
				var resolution = 648;
				var ratio = 16 / 9;
				break;
			case 2:
				var resolution = 720;
				var ratio = 16 / 9;
				break;
			case 3:
				var resolution = 768;
				var ratio = 16 / 9;
				break;
			case 4:
				var resolution = 900;
				var ratio = 16 / 9;
				break;
			case 5:
				var resolution = 1080;
				var ratio = 16 / 9;
				break;
		}
	
		// decode FPS values
		if (global._fps == undefined) {
			global._fps = 1;	
		}
		switch (global._fps) {
			case 0:
				var frames = 30;
				global._fpsReal = 30;
				break;
			case 1:
				var frames = 60;
				global._fpsReal = 60;
				break;
			case 2:
				var frames = 120;
				global._fpsReal = 120;
				break;
			case 3:
				var frames = 144;
				global._fpsReal = 144;
				break;
			case 4:
				var frames = 240;
				global._fpsReal = 240;
				break;
		}
	
		if (global.fullscreen == undefined) {
			global.fullscreen = false;
		}
	
		if (global.interpolation == undefined) {
			global.interpolation = false;	
		}
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region Starup Options
	// ---------------------------------------------------------------------------------------------------

	var antiAlias = 4;			// AA level
	if (!optionsFound) {
		var frames = 144;		   // FPS
		global._fpsReal = 144;
		var resolution = 720;	// height of window in pixels
		var ratio = 0;			   // aspect ratio; 0 for native ratio
	}
	var interpolation = global.interpolation;
	var fullscreen = global.fullscreen;		// fullscreen option

	// dynamic rooms (change size)
	var dynRoom = [];

	if (os_get_config() == "release") {
		gml_release_mode(true);	
	}

   #endregion
	// ---------------------------------------------------------------------------------------------------


	// ---------------------------------------------------------------------------------------------------
   #region Startup Script
	// ---------------------------------------------------------------------------------------------------

	// Runs this script on game start
	gml_pragma(global, "startup();");

	// Set the FPS
	game_set_speed(frames, gamespeed_fps);

	// Set ideal width & height for 16:9
	// leave idealWidth 0 here because it auto-adjusts later
	var idealWidth = 0;
	var idealHeight = resolution;

	// get aspect ratio for native resolution
	if (ratio == 0){
		var aspectRatio = display_get_width() / display_get_height();
	} else {
		var aspectRatio = ratio;
	}
	global.aspectRatio = ratio;

	// set width in reference to given height and aspect ratio
	idealWidth = floor(idealHeight * aspectRatio);

	// make sure width is even number
	if (idealWidth & 1){
		idealWidth++;	
	}

	// change all rooms to same resolution
	for (var i = 0; i < array_length_1d(dynRoom); i++){
		if (room_exists(dynRoom[i])){
			room_set_width(dynRoom[i], idealWidth);
			room_set_height(dynRoom[i], idealHeight);
		}
	}

	// Update views for rm_game
	var gameCam = camera_create_view(0, 0, idealWidth, idealHeight);
	camera_set_view_size(gameCam, idealWidth, idealHeight);
	room_set_camera(rm_game, 0, gameCam);

	// set window parameters in concordance to width and height
	surface_resize(application_surface, idealWidth, idealHeight);
	window_set_size(idealWidth, idealHeight);
	window_set_fullscreen(fullscreen);

	gpu_set_texfilter(interpolation);

	// always false, changed when applying new settings in o_settingsChange
	global.optionsApplied = false;

	// globalize resolution
	global.resWidth = idealWidth;
	global.resHeight = idealHeight;

	// set AA and vsync
	display_reset(antiAlias, false);

   #endregion
	// ---------------------------------------------------------------------------------------------------


   // ---------------------------------------------------------------------------------------------------
   #region Settings Output
   // ---------------------------------------------------------------------------------------------------

   debugMsg("\n\n==================")
   debugMsg("Framerate: " + string(global._fpsReal))
   debugMsg("Fullscreen: " + string(global.fullscreen))
   debugMsg("Interpolation: " + string(global.interpolation))
   debugMsg("Resolution: " + string(global.resWidth) + "x" + string(global.resHeight))
   debugMsg("==================\n\n")

   #endregion
   // ---------------------------------------------------------------------------------------------------
}