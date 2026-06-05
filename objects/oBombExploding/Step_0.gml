if(place_meeting(x, y, oCrackedWall))
{
	instance_destroy(instance_place(x, y, oCrackedWall));
}

x += xsp;
xsp = lerp(xsp, 0, 0.25);
y += ysp;
ysp = lerp(ysp, 0, 0.25);

image_speed = lerp(image_speed, 0.75, 0.5);

event_inherited();