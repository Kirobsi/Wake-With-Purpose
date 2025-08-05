if(place_meeting(x, y, oPlayer) && !pushed)
{
	image_index = 1;
	pushed = true;
	attachedgate.phy_active = false;
}

if(pushed)
{
	with(attachedgate)
	{
		image_yscale = lerp(image_yscale, 0.1, 0.4);
	}
}