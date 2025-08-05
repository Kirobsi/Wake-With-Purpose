if(floor(oPlayer.y) <= bbox_top + 2 && oPlayer.phy_speed_y >= 0)
{
	oPlayer.touchedSpring = true;
	oPlayer.jumping = true;
	oPlayer.phy_speed_y -= 14 + currentspeed / 2;
}