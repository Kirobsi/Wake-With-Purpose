if(moving) {
	x -= 0.4;
	y += 1;
	image_angle += 0.25;
	if(place_meeting(x, y, oTerrain) && canLand) {
		moving = false;
	}
}
else {
	image_alpha = lerp(image_alpha, 0, 0.1);
	if(image_alpha < 0.05) {
		instance_destroy();
	}
}