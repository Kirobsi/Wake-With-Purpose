if(place_meeting(x, y, oPlayer) && oPlayer.alarm[0] == -1)
{
	oPlayer.alarm[0] = 120;
	oPlayer.phy_speed_x = 10 * sign(oPlayer.x - x);
	oPlayer.phy_speed_y = -5;
	if(oPlayer.filledslots > 0)
	{
		var _rand = irandom_range(0, oPlayer.filledslots - 1);
		var _losting = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oLostIngredient);
		_losting.sprite_index = oPlayer.inv[_rand][1];
		oPlayer.inv[_rand][0] = "Lost";
		oPlayer.inv[_rand][1] = sLost;
	}
}