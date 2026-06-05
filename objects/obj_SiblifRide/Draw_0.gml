draw_self();

draw_set_alpha(drawAlpha);
draw_set_colour(c_black);
draw_rectangle(0, 0, 960, 540, false);
draw_set_colour(c_white);

draw_set_alpha(promptAlpha);
draw_set_halign(fa_center);
draw_set_font(MainText);
font_enable_effects(MainText, true, {
	dropShadowEnable : true,
	dropShadowSoftness : 8,
	dropShadowOffsetY : 2,
	dropShadowOffsetX : 2,
	dropShadowColour : c_black
})
draw_text(480, 400, global.allStrings[# 0, 1496]);
font_enable_effects(MainText, false)

draw_set_alpha(1);