var xcam = camera_get_view_x(view_camera[0]);
var xpos = xcam - (90 * (xcam / room_width));

var ycam = camera_get_view_y(view_camera[0]);
var ypos = ycam - (136 * (ycam / (room_height)));

x = xpos + xoffset;
y = ypos;

draw_self();
x -= 968;
draw_self();
x += 968;