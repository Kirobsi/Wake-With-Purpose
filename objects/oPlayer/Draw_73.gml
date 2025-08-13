#region Inventory

draw_set_alpha(1);

//Slots
for(var i = 1; i <= 10; i++)
{
	draw_sprite_ext(sSlot, global.hideInventory, camera_get_view_x(view_camera[0]) + (88 * i), camera_get_view_y(view_camera[0]) + 64, 2, 2, 0, c_white, 1);
}

//Ingredients
for(var i = 1; i <= 10; i++)
{
	draw_sprite_ext(inv[i-1][1], global.hideInventory, camera_get_view_x(view_camera[0]) + (88 * i), camera_get_view_y(view_camera[0]) + 64, 2, 2, 0, c_white, 1);
}

#endregion