if(place_meeting(x, y, oCrackedWall))
{
	instance_destroy(instance_place(x, y, oCrackedWall));
}

event_inherited();