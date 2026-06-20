if (global.horVisible) {
	if (event_data[? "guiposX"] <= 122) {
		if (!global.leftKey) {
			global.leftKeyPressed = true;
			LColour = #C3C360;
			alarm_set(0, 1);
	
			global.rightKey = false;
			RColour = #E2F7FF;
		}
	
		global.leftKey = true;
	}

	else {
		if (!global.rightKey) {
			global.rightKeyPressed = true;
			RColour = #C3C360;
			alarm_set(1, 1);
	
			global.leftKey = false;
			LColour = #E2F7FF;
		}
	
		global.rightKey = true;
	}
}