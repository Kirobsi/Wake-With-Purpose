draw_sprite_ext(spr_beachBackground, 2, 0, 0, 2, 2, 0, c_white, tentAlpha);	//draw tent

draw_sprite_ext(global.lastSibDraw, global.siblifFatStage[global.lastNum], 440, 36, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.thirdSibDraw, global.siblifFatStage[global.threNum], 440, 36, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.secondSibDraw, global.siblifFatStage[global.twoNum], 440, 36, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.topSibDraw, global.siblifFatStage[global.topNum], 440, 36, 2, 2, 0, c_white, siblifAlpha);

draw_set_alpha(drawAlpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_set_colour(c_white);