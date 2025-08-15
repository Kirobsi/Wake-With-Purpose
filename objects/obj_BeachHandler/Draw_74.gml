draw_sprite_ext(spr_beachBackground, 3, 0, 0, 2, 2, 0, c_white, tentAlpha);	//draw tent

draw_sprite_ext(global.lastSibDraw, global.siblifFatStage[global.lastNum], global.sibPos, 16, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.thirdSibDraw, global.siblifFatStage[global.threNum], global.sibPos, 16, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.secondSibDraw, global.siblifFatStage[global.twoNum], global.sibPos, 16, 2, 2, 0, c_white, siblifAlpha);
draw_sprite_ext(global.topSibDraw, global.siblifFatStage[global.topNum], global.sibPos, 16, 2, 2, 0, c_white, siblifAlpha);

draw_set_alpha(drawAlpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_set_colour(c_white);