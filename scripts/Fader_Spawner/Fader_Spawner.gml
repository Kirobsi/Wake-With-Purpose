///@description Function to fade from black at the start of a room
function fade_from_black(_timer = 1) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	
	instance_create_layer(_x, _y, "UI", oFader, {
		//fadeFromBlack : true,
		drawAlpha : 1,
		x : _x,
		y : _y,
		timer : _timer
	})
}

///@description Function to fade to black and then travel to a new room
///@param {Asset, Asset.GMRoom} _targetRoom The destination you wish to travel to
///@param {Bool} _travelBool Whether or not to travel somewhere (dunno why this is optional lol)
function fade_to_black(_targetRoom = rmBeach, _travelBool = true) {
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);
	
	instance_create_layer(_x, _y, "UI", oFader, {
		fadeToBlack : true,
		drawAlpha : 0,
		x : _x,
		y : _y,
		targetRoom : _targetRoom,
		doTravel : _travelBool
	})
}