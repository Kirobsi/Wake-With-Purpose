if(global.interactKeyPressed && held == true)
{
	held = false;
	oPlayer.holding = false;
}

if(place_meeting(x, y, oPlayer) && global.interactKeyPressed && oPlayer.holding == false && held == false)
{
	held = true;
	oPlayer.holding = true;
}

if(held)
{
	x = oPlayer.x + (32 * sign(oPlayer.image_xscale));
	y = oPlayer.y - 16;
}