heightCycle++;
if (heightCycle > 150) {
	heightCycle = 0;
}

y = (6 * sin(heightCycle * pi / 75)) + yPos;

if (place_meeting(x, y, oPlayer) && global.interactKeyPressed && !instance_exists(obj_Textbox) && !instance_exists(oFader)) {
	if (room == rmBeach) {
		if (x < 100) {
			if (array_length(obj_System.jungleFoodTaken) >= 29) {create_textbox(1497);}
			else {create_textbox(1491);}
		}
		
		else if (x > 100 && x < 800) {
			if (array_length(obj_System.caveFoodTaken) >= 29) {create_textbox(1499);}
			else {create_textbox(1493);}
		}
		
		else if (x > 900) {
			if (array_length(obj_System.mountainFoodTaken) >= 29) {create_textbox(1495);}
			else {create_textbox(1489);}
		}
	} else {
		create_textbox(69);
	}
}