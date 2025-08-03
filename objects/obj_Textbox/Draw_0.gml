draw_set_halign(hAlignment);


image_index = hasBackground;
draw_self();
											  
draw_text_ext(x + xOffset, y + yOffset, currentStringDrawn, 24, 646);		//draw string
draw_text_ext(x + xOffset, y + yOffset - 35, characterName, 24, 646);		//draw string
draw_text_ext(x + xOffset + 93, y + yOffset - 35, pronounString, 24, 110)	//draw pronouns