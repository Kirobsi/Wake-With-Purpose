heightCycle++;
if (heightCycle > 150) {
	heightCycle = 0;
}

y = (6 * sin(heightCycle * pi / 75)) + yPos;

if (place_meeting(x, y, oPlayer) && global.interactKeyPressed && !instance_exists(obj_Textbox) && !instance_exists(oFader)) {
	create_textbox(69);
}