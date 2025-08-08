//Slots
for(var i = 1; i <= 10; i++)
{
	draw_sprite(sSlot, global.hideInventory, camera_get_view_x(view_camera[0]) + (88 * i), camera_get_view_y(view_camera[0]) + 64);
}

//Ingredients
for(var i = 1; i <= 10; i++)
{
	draw_sprite(inv[i-1][1], global.hideInventory, camera_get_view_x(view_camera[0]) + (88 * i), camera_get_view_y(view_camera[0]) + 64);
}

#endregion