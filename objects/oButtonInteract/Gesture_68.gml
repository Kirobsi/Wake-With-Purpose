if (touchIndex == event_data[? "touch"]) {
	global.interactKey = false;
	global.interactReleased = true;
	alarm_set(1, 1);
	daColour = #E2F7FF;
}