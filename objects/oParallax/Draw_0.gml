var xcam = camera_get_view_x(view_camera[0]);
var xpos = xcam - ((swidth - 960) * (xcam / room_width));

var ycam = camera_get_view_y(view_camera[0]);
var ypos = ycam - ((sheight - 540) * (ycam / room_height));

x = xpos;
y = ypos;
draw_self();
//draw_sprite(sprite_index, 0, xpos, ypos);