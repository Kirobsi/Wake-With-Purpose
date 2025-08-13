if(!jumping && global.jumpKeyPressed && global.canControlPlayer)
{
	jumping = true;
	jumpDelay = true;
	phy_speed_y -= 7;
	audio_play_sound(snd_PlrJump, 0, 0);
}