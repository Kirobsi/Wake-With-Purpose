if(falling) 
{
	ysp += 0.25;
	image_alpha = lerp(image_alpha, 0, 0.2);
}
phy_position_y += ysp;

//shake back and forth before falling
if(alarm_get(0) > 0)
{
	if(alarm[0] mod 4 == 1)
	{
		phy_position_x = startingx - 1;
	}
	else if(alarm[0] mod 4 == 3)
	{
		phy_position_x = startingx + 1;
	}
}

//"grow" animation when spawning
image_xscale = lerp(image_xscale, 1, 0.5);
image_yscale = lerp(image_yscale, 1, 0.5);

