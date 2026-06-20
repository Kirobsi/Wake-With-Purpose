if (instance_exists(obj_Textbox) || instance_exists(obj_Textbox_Misc)) {
touchIndex = event_data[? "touch"];

	#region up/down controls handling

	if (event_data[? "guiposX"] >= 72 && event_data[? "guiposX"] <= 172 &&
	  event_data[? "guiposY"] >= 160 && event_data[? "guiposX"] <= 380 && global.verVisible) {
		if (event_data[? "guiposY"] <= 270) {
			global.upKeyPressed = true;
			global.upKey = true;
			alarm_set(0, 1);
			UColour = #C3C360;
		}

		else {
			global.downKeyPressed = true;
			global.downKey = true;
			alarm_set(1, 1);
			DColour = #C3C360;
		}
	}

	#endregion


	#region advance text

	else {
		if (global.gameState > 0 || event_data[? "guiposX"] >= 250) {
			global.jumpKeyPressed = true;
			alarm_set(2, 1);
		}
	}
	
	#endregion
}