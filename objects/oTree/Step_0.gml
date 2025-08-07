if(place_meeting(x, y, oPlayer))
{
	if(currentspeed > 0)
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
			    }
			}
			
			ds_list_destroy(_list);
		}
	}
}