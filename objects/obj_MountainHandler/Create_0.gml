localState = obj_System.mountainState;

if(localState == 1)
{
	
}

foodTaken = obj_System.mountainFoodTaken;
deleteFood = true;

instance_create_layer(x, y, "UI", oTitleCard,
{
	cardtext : "Topping Mountain"
});
fade_from_black(75);

//music
audio_sound_gain(mus_Stage, 3, 0);
if (obj_System.songPlaying != mus_Stage)
{
	if (typeof(obj_System.songPlaying) == "ref") {audio_stop_sound(obj_System.songPlaying);}
	obj_System.songPlaying = mus_Stage;
	var _song = audio_play_sound(obj_System.songPlaying, true, 1, 1);
	audio_sound_loop_start(_song,29.05);
	audio_sound_loop_end(_song,89.68);
}