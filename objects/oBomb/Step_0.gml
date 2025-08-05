image_xscale = lerp(image_xscale, 1, 0.5);
image_yscale = lerp(image_yscale, 1, 0.5);

if(bombstate == 0)
{
	if(global.interactKeyPressed && place_meeting(x, y, oPlayer))
	{
		bombstate = 1;
	}
}
else if(bombstate == 1)
{
	x = oPlayer.x + (32 * sign(oPlayer.image_xscale));
	y = oPlayer.y - 16;
	if(global.interactKeyPressed)
	{
		facing = sign(oPlayer.image_xscale);
		bombstate = 2;
	}
}
else if(bombstate == 2)
{
	x += xsp * facing;
	y += ysp;
	ysp += 0.5;
	if(place_meeting(x, y, oTerrain))
	{
		instance_create_layer(x, y, "Instances", oBombExploding);
		bombstate = 0;
		x = xstart;
		y = ystart;
		image_xscale = 0;
		image_yscale = 0;
		ysp = -5;
	}
}