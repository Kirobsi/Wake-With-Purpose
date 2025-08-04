if(floor(oPlayer.y) <= bbox_top + 2 && oPlayer.phy_speed_y >= 0)
{
	oPlayer.jumping = false;
	oPlayer.phy_speed_y -= 14;
}