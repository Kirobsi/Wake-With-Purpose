draw_set_halign(hAlignment);

draw_self();
											  
draw_text_ext(x + xOffset, y + yOffset, currentStringDrawn, 24, boxWidth);	//draw string
draw_text_ext(x + xOffset, y + yOffset - 42, characterName, 24, boxWidth);	//draw name
draw_text_ext(x + xOffset + 86, y + yOffset - 42, pronounString, 24, 110);	//draw pronouns

#region Dialogue Option Rendering

for (var i = talkOptions - 1; i >= 0; i--) {
	draw_sprite(spr_TalkOption, (i == talkOptionsPosition), x + 343, y - 1 - (i * talkOptHeight))
	draw_text_ext(x + 350, y - 33 - (i * talkOptHeight), global.allStrings[# (i + 1) * 2, dialogueRow], 24, 307)
}

#endregion