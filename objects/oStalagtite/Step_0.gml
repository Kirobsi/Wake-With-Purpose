event_inherited();

if(place_meeting(x, y + 128, oPlayer))
{
	falling = true;
}

if(falling)
{
	ysp += 0.1;
}

y += ysp;