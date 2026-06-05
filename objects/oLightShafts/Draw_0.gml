xcam = camera_get_view_x(view_camera[0]);
xpos = xcam - ((swidth - 960) * (xcam / room_width));

ycam = camera_get_view_y(view_camera[0]);
ypos = ycam - ((sheight - 540) * (ycam / room_height));

x = xpos;
y = ypos;

draw_self();
x += sprite_width;
draw_self();