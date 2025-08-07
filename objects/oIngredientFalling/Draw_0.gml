draw_self();

draw_set_halign(fa_center);
draw_text_color(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2),
camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 1.25),
_string + name,
c_white, c_white, c_white, c_white, showtext);