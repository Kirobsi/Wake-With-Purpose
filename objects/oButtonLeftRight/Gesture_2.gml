touchIndex = event_data[? "touch"];

if (event_data[? "guiposX"] < 122) {
	global.leftKeyPressed = true;
	global.leftKey = true;
	alarm_set(0, 1);
	LColour = #C3C360;
}

else {
	global.rightKeyPressed = true;
	global.rightKey = true;
	alarm_set(1, 1);
	RColour = #C3C360;
}