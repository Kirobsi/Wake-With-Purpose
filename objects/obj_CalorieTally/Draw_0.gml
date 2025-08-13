draw_set_colour(c_black);
draw_set_alpha(rectangleAlpha);
draw_rectangle(0,0,960,540,false);

draw_set_font(ResultsText);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_center);
font_enable_effects(ResultsText, true, {
	dropShadowEnable : true,
	dropShadowSoftness : 16,
	dropShadowOffsetY : 4,
	dropShadowOffsetX : 4,
	dropShadowColour : c_black
})
if (text1) {draw_text_ext(480, 114, "Day #" + string(global.cycles) + " Complete!", 24, 856);}
if (text2) {draw_text_ext(480, 176, "You've cooked up: " + string(risingCalories) + " Calories!", 24, 856);}
draw_set_colour(c_yellow);
if (text3) {draw_text_ext(480, 422, rankText, 24, 856);}

font_enable_effects(ResultsText, false);
draw_set_font(MainText);