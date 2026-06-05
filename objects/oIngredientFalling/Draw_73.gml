draw_set_halign(fa_center);
draw_set_font(MainText);
font_enable_effects(MainText, true, {
    dropShadowEnable : true,
    dropShadowSoftness : 16,
    dropShadowOffsetY : 2,
    dropShadowOffsetX : 2,
    dropShadowColour : c_black
})
draw_text_color(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2),
	camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 1.25),
	_string + name,
	c_white, c_white, c_white, c_white, showtext);

font_enable_effects(MainText, false);