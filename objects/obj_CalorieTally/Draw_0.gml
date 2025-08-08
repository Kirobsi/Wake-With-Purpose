draw_set_colour(c_black);
draw_set_alpha(rectangleAlpha);
draw_rectangle(0,0,960,540,false);

draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_center);
if (text1) {draw_text_ext(480, 114, "Cycle Complete!", 24, 856);}
if (text2) {draw_text_ext(480, 168, "Calories Collected: " + string(risingCalories), 24, 856);}
if (text3) {draw_text_ext(480, 434, rankText, 24, 856);}
