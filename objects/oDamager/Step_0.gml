if(place_meeting(x, y, oPlayer) && oPlayer.alarm[0] == -1)
{
	oPlayer.alarm[0] = 120;
	oPlayer.phy_speed_x = 10 * sign(oPlayer.x - x);
	oPlayer.phy_speed_y = -5;
	if(oPlayer.filledslots > 0)
	{
		var _numLost = 0;
		for (var i = 0; i < 10; i++;) {
			if (oPlayer.inv[i][0] == "Lost") {_numLost++;}
		}
		if (_numLost > 5) {return}
		
		var _rand = irandom_range(0, oPlayer.filledslots - 1);
		while (oPlayer.inv[_rand][0] == "Lost") {
			_rand = irandom_range(0, oPlayer.filledslots - 1);
		}
		
		var _losting = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oLostIngredient);
		_losting.sprite_index = oPlayer.inv[_rand][1];
		oPlayer.inv[_rand][0] = "Lost";
		oPlayer.inv[_rand][1] = sLost;
		oPlayer.inv[_rand][2] = 3;
		oPlayer.inv[_rand][3] = 0;
	}
}