draw_set_font(MainText)
draw_set_halign(fa_center);
draw_set_colour(c_white)
if (startupState == 0) {draw_text(480, 180, "Volume: " + string(global.volumeLevel))};
