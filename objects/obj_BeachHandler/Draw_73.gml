draw_sprite_ext(spr_beachBackground, 2, 960, 0, -2, 2, 0, c_white, tentAlpha);	//draw tent

draw_sprite_ext(spr_SiblifPlaceholder, 0, 500, 44, 2, 2, 0, c_white, siblifAlpha);
//draw_sprite_ext(spr_SiblifBase, global.siblifFatStage[3], 830, 60, -2, 2, 0, c_white, siblifAlpha);
//draw_sprite_ext(spr_SiblifLegs, global.siblifFatStage[2], 830, 60, -2, 2, 0, c_white, siblifAlpha);
//draw_sprite_ext(spr_SiblifBelly, global.siblifFatStage[1], 830, 60, -2, 2, 0, c_white, siblifAlpha);
//draw_sprite_ext(spr_SiblifBoobs, global.siblifFatStage[0], 830, 60, -2, 2, 0, c_white, siblifAlpha);

draw_set_alpha(drawAlpha * fadeFromBlack);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_set_colour(c_white);