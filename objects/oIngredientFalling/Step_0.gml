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
		instance_destroy();
	}
}
else
{
	showtext = false;
}

if(falling)
{
	ysp += 1;
	y += ysp;
	if(place_meeting(x, y + ysp, oTerrain))
	{
		y = instance_place(x, y + ysp, oTerrain).bbox_top - 16;
		falling = false;
	}
}