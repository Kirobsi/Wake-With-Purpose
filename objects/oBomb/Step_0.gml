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
		alarm_set(0, 60);
		bombstate = 3;
		sprite_index = sBombLit;
	}
}

switch(alarm[0]) {
	case 60: image_index = 0; break;
	case 50: image_index = 1; break;
	case 40: image_index = 2; break;
	case 30: image_index = 3; break;
	case 20: image_index = 4; break;
	case 10: image_index = 5; break;
}

if(sprite_index == sBombLit) {
	switch(image_index) {
		case 0: instance_create_layer(bbox_left + 16, bbox_top, "Instances_1", oBombSpark); break;
		case 1: instance_create_layer(bbox_left + 14, bbox_top, "Instances_1", oBombSpark); break;
		case 2: instance_create_layer(bbox_left + 14, bbox_top + 2, "Instances_1", oBombSpark); break;
		case 3: instance_create_layer(bbox_left + 12, bbox_top + 2, "Instances_1", oBombSpark); break;
		case 4: instance_create_layer(bbox_left + 12, bbox_top + 4, "Instances_1", oBombSpark); break;
		case 5: instance_create_layer(bbox_left + 12, bbox_top + 6, "Instances_1", oBombSpark); break;
	}
}