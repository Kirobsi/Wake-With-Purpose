draw_set_halign(hAlignment);

image_index = hasBackground;
draw_self();
											  
draw_text_ext(x + xOffset, y + yOffset, currentStringDrawn, 24, 646);		//draw string
draw_text_ext(x + xOffset, y + yOffset - 35, characterName, 24, 646);		//draw name
draw_text_ext(x + xOffset + 93, y + yOffset - 35, pronounString, 24, 110)	//draw pronouns

#region Dialogue Option Rendering

for (var i = talkOptions - 1; i >= 0; i--) {
	draw_sprite(spr_TalkOption, (i == talkOptionsPosition), x + 343, y - (i * talkOptHeight) - (i * talkOptGap))
	draw_text_ext(x + 350, y - 32 - (i * talkOptHeight) - (i * talkOptGap), global.allStrings[# (i + 1) * 2, dialogueRow], 24, 307)
}

#endregion