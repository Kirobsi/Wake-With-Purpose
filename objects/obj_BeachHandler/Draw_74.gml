draw_sprite_ext(spr_beachBackground, 3, 0, 0, 2, 2, 0, c_white, tentAlpha);	//draw tent

#region Siblif Draw
if (!surface_exists(siblifSurface)) {siblifSurface = surface_create(960, 540);}	//prevents crash when entering/exiting fullscreen
//(why did that crash???? for context: I originally created the surface in the Create event, but that's gone now since it's redundant)

surface_set_target(siblifSurface);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(global.lastSibDraw, global.siblifFatStage[global.lastNum], global.sibPos, 540, 2, 2, 0, c_white, 1);
draw_sprite_ext(global.thirdSibDraw, global.siblifFatStage[global.threNum], global.sibPos, 540, 2, 2, 0, c_white, 1);
draw_sprite_ext(global.secondSibDraw, global.siblifFatStage[global.twoNum], global.sibPos, 540, 2, 2, 0, c_white, 1);
draw_sprite_ext(global.topSibDraw, global.siblifFatStage[global.topNum], global.sibPos, 540, 2, 2, 0, c_white, 1);
draw_set_alpha(siblifAlpha);
surface_reset_target();

draw_surface(siblifSurface, 0, 0);

#endregion


#region Black Square for Fades

draw_set_alpha(drawAlpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_alpha(1);
draw_set_colour(c_white);

#endregion