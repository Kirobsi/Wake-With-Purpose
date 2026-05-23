image_xscale = lerp(image_xscale, 2, 1);
image_yscale = lerp(image_yscale, 2, 1);

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
		alarm_set(0, 90);
		bombstate = 3;
		sprite_index = sBombLit;
	}
}