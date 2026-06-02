var xcam = camera_get_view_x(view_camera[0]);
var xpos = xcam - ((swidth - 960) * (xcam / room_width));

var ycam = camera_get_view_y(view_camera[0]);
var ypos = ycam - ((sheight - 540) * (ycam / room_height));

x = xpos;
y = ypos;

for (var i = 0; i <= (tiling); i++) {
	x = xpos + (sprite_width * i);
	draw_self();
}