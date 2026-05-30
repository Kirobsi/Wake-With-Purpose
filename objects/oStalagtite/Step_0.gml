event_inherited();

if(place_meeting(x, y + 128, oPlayer))
{
	falling = true;
}

if(falling)
{
	if(!position_meeting(x, bbox_bottom - 8, oTerrain)) {
		ysp += 0.1;
	}
	else {
		ysp = 0;
		image_alpha = lerp(image_alpha, 0, 0.15);
		if(image_alpha < 0.05) instance_destroy();
	}
}

y += ysp;