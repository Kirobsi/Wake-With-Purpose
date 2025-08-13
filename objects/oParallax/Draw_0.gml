var xcam = camera_get_view_x(view_camera[0]);
var xpos = xcam - ((sprite_width - 960) * (xcam / room_width));

var ycam = camera_get_view_y(view_camera[0]);
var ypos = ycam - ((sprite_height - 540) * (ycam / room_height));

draw_sprite(sprite_index, 0, xpos, ypos);