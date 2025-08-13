localState = obj_System.caveState;

if(localState == 1)
{
	//Allow passage to phase 2 area
	instance_destroy(oCavePhaseBlocker);
}

deleteFood = true;

instance_create_layer(x, y, "UI", oTitleCard,
{
	cardtext : "Bottom Cave"
});
fade_from_black(75);

//music
//audio_sound_gain(mus_Stage, 1, 0);
if (obj_System.songPlaying != mus_Stage)
{
	//if (typeof(obj_System.songPlaying) == "ref") {audio_stop_sound(obj_System.songPlaying);}
	obj_System.songPlaying = mus_Stage;
	var _song = audio_play_sound(obj_System.songPlaying, true, 1, 1);
	audio_sound_gain(_song, 1, 0);
	audio_sound_loop_start(_song,29.05);
	audio_sound_loop_end(_song,89.68);
}