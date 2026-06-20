if (touchIndex == event_data[? "touch"]) {
	global.jumpKey = false;
	global.jumpKeyReleased = true;
	alarm_set(1, 1);
	daColour = #E2F7FF;
}