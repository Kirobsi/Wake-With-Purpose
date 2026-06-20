draw_set_font(MainText);
draw_set_halign(hAlignment);

draw_self();
											  
currentString.align(hAlignment).wrap(boxWidth).draw(x + xOffset, y + yOffset, typist);	//draw string
draw_text_ext(x + xOffset, y + yOffset - 42, characterName, 24, boxWidth);	//draw name
draw_set_halign(fa_center);
draw_text_ext(x + xOffset + 124, y + yOffset - 42, pronounString, 24, 110);	//draw pronouns
draw_set_halign(hAlignment);

#region Dialogue Option Rendering

for (var i = talkOptions - 1; i >= 0; i--) {
	draw_sprite(spr_TalkOption, (i == talkOptionsPosition), x + 343, y - 1 - (i * talkOptHeight))
	draw_text_ext(x + 350, y - 30 - (i * talkOptHeight), global.allStrings[# (i + 1) * 2, dialogueRow], 24, 307)
}

#endregion

// Draw up/down buttons, so that they actually render above
if (os_type == os_android) {
	draw_sprite_ext(sMobileButtons, 1, oButtonUpDown.xpos, oButtonUpDown.yposU,  2, 2, 0, oButtonUpDown.UColour, global.verVisible);
	draw_sprite_ext(sMobileButtons, 1, oButtonUpDown.xpos, oButtonUpDown.yposD + 100, 2, -2, 0, oButtonUpDown.DColour, global.verVisible);
}