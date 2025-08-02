if (obj_kiwi.y - y < 260) {
//Draw the 450px wide, 200px tall text box
	draw_rectangle(x + 150, y + 350, x + 810, y + 480, true);
	
	draw_text_ext(x + 157, y + 357, currentStringDrawn, 24, 646);
} else {
	draw_rectangle(x + 150, y + 60, x + 810, y + 190, true);
	
	draw_text_ext(x + 157, y + 67, currentStringDrawn, 24, 646);
}