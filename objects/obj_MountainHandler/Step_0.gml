//launch player up if they fall into a pit
if(oPlayer.phy_position_y >= room_height)
{
	oPlayer.phy_speed_y = -10;
	oPlayer.jumping = false;
}