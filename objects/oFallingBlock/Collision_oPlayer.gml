if(!touched && oPlayer.phy_com_y < phy_com_y)
{
	alarm_set(0, 30);
	touched = true;
}

if(oPlayer.phy_com_y < phy_com_y && !oPlayer.jumping)
{
	oPlayer.phy_speed_y += 20;
}