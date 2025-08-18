heightCycle++;
if (heightCycle > 150) {
	heightCycle = 0;
}

y = (5 * sin(heightCycle * pi / 75)) + yPos;

if (place_meeting(x, y, oPlayer) && global.interactKeyPressed && !instance_exists(obj_Textbox) && !instance_exists(oFader)) {
	if (room == rmBeach) {
		if (layer_get_visible("LeaveArea")) {
			if (array_length(obj_System.caveFoodTaken) >= 27) {
				create_textbox(927);
			}
			else if (array_length(obj_System.jungleFoodTaken) >= 34) {
				create_textbox(928);
			}
			else if (array_length(obj_System.mountainFoodTaken) >= 29) {
				create_textbox(929);
			} else {create_textbox(172);}
		}
	} else {
		create_textbox(69);
	}
}