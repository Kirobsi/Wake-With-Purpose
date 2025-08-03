if(place_meeting(x, y, oPlayer))
{
	showtext = true;
	if(global.interactKey)
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