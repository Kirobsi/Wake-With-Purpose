if(place_meeting(x, y, oPlayer) && !pushed)
{
	image_index = 1;
	pushed = true;
	obj_System.cavegatelowered = true;
	attachedgate.phy_active = false;
}

if(pushed)
{
	with(attachedgate)
	{
		image_yscale = lerp(image_yscale, 0.05, 0.4);
	}
}