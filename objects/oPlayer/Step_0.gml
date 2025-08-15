#region Horizontal Movement

if(global.leftKey && global.canControlPlayer)
{
	phy_speed_x = lerp(phy_speed_x, -4, 0.3);
}
else if(global.rightKey && global.canControlPlayer)
{
	phy_speed_x = lerp(phy_speed_x, 4, 0.3);
}
else
{
	phy_speed_x = lerp(phy_speed_x, 0, 0.3);
}

#endregion

#region Release Jump

if(global.jumpKeyReleased && phy_speed_y < 0 && jumping = true && !touchedSpring)
{
	phy_speed_y = 0;
}

#endregion

#region Clear 'jumping' when on ground

if(!(position_meeting(x-8,y+1,oTerrain) || position_meeting(x+7,y+1,oTerrain)))
{
	jumping = true;
}

else if (!jumpDelay && jumping) {
	jumping = false;
	touchedSpring = false;
	audio_play_sound(snd_PlrLand,0,0)
	instance_create_layer(x, y, "UI", oParticle, {sprite_index : sParticleLandJump});
}

#endregion

#region Stick to Ground

//if(physics_test_overlap(x, y + 1, 0, oTerrain))
//{
//	phy_speed_y = 0;
//}

#endregion

#region Animation

if(abs(phy_speed_x) > 1)
{
	sprite_index = sPlayerWalk;
	image_xscale = sign(phy_speed_x) * 2;
}
else
{
	sprite_index = sPlayerStand;
}

//Invincibility frames flash
if(alarm[0] != -1)
{
	image_blend = c_blue;
}
else
{
	image_blend = c_white;
}

#endregion


#region Clear jumpDelay

jumpDelay = false;

#endregion