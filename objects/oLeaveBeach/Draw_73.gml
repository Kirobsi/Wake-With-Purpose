draw_set_halign(fa_center);
draw_set_font(MainText);
font_enable_effects(MainText, true, {
    dropShadowEnable : true,
    dropShadowSoftness : 16,
    dropShadowOffsetY : 2,
    dropShadowOffsetX : 2,
    dropShadowColour : c_black
})
draw_text_color(480, 432, global.allStrings[# 0, stringnum], c_white, c_white, c_white, c_white, showtext);

font_enable_effects(MainText, false);