if(falling) ysp += 0.25;
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