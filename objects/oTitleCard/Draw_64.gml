draw_set_font(ResultsText);
draw_set_colour(c_white);
font_enable_effects(ResultsText, true, {
    dropShadowEnable : true,
    dropShadowSoftness : 16,
    dropShadowOffsetY : 4,
    dropShadowOffsetX : 4,
    dropShadowColour : c_black
})
draw_set_halign(fa_left);
draw_set_alpha(image_alpha);
draw_text(64 + horiz, 256, currenttext);
draw_set_alpha(1);

draw_set_font(MainText);