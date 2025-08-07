if(place_meeting(x, y-16, oPlayer))
{
	if (peakspeed < oPlayer.phy_speed_y) {peakspeed = oPlayer.phy_speed_y}
	if(peakspeed > 3 && !oPlayer.jumping)
	{
		if(place_meeting(x, y, oIngredientFalling))
		{
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, oIngredientFalling, _list, false);
			
			if (_num > 0)
			{
			    for (var i = 0; i < _num; ++i;)
			    {
			        _list[| i].falling = true;
					_list[| i].ysp = peakspeed;
			    }
			}
			
			ds_list_destroy(_list);
		}
		
		peakspeed = 0;
	}
}

else {peakspeed = 0}