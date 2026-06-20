if (global.actVisible) {
	global.interactKeyPressed = true;
	global.interactKey = true;
	alarm_set(0, 1);
	daColour = #C3C360;
	touchIndex = event_data[? "touch"];
}