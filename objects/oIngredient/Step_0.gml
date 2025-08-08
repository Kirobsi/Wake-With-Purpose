if(place_meeting(x, y, oPlayer))
{
	showtext = true;
	_string = "Press Interact to take ";
	if (oPlayer.filledslots > 9) {
		_string = "Too full to take ";
	}
	
	else if(global.interactKey)
	{
		oPlayer.inv[oPlayer.filledslots][0] = name;
		oPlayer.inv[oPlayer.filledslots][1] = sprite_index;
		oPlayer.filledslots += 1;
			
		if (instance_exists(obj_CaveHandler)) {
			array_push(obj_System.caveFoodTaken, id);
			show_debug_message("fuck !!! my ingerroidin")
			show_debug_message(obj_System.caveFoodTaken)
		}
			
		instance_destroy();
	}
}
else
{
	showtext = false;
}