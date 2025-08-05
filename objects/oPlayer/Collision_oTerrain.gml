if(!jumping && global.jumpKeyPressed && global.canControlPlayer)
{
	jumping = true;
	jumpDelay = true;
	phy_speed_y -= 7;
}