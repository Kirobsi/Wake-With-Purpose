visible = true;
drawAlpha = 1;
fadeFromBlack = true;
fadeToBlack = false;

tentAlpha = 0;
fadeToTent = false;
fadeFromTent = false;

//pull local state from obj_System
localState = 0;

siblifAlpha = 0;
fadeInSiblif = false;
fadeOutSiblif = false;

_filledslots = -1;
slotsToCashIn = [];
primaryCalories = 0;
dayCalories = 0;

if (global.gameState == 2) {
	alarm_set(0, 90)
	layer_set_visible("SiblifForeground",true);
	beachBlur = 1;
	firstVisit = true;
}

else if (global.gameState > 2) {
	layer_set_visible("Instances", true);
	layer_set_visible("Instances_1", true);
	
	if (obj_System.songPlaying != mus_Home) {
		obj_System.songPlaying = mus_Home;
		var _song = audio_play_sound(obj_System.songPlaying, true, 1, 1);
		audio_sound_gain(_song, 1, 0);
		audio_sound_loop_start(_song,1686859/44100);
		audio_sound_loop_end(_song,5801391/44100);
	}
	
	layer_set_visible("LeaveArea", true);
	
	for (var i = 0; i < 10; i++) {
		if (obj_System.invCopy[i][0] != "Nothing" && obj_System.invCopy[i][0] != "Lost") {
			layer_set_visible("LeaveArea", false);
		}
	}
	
	if (layer_get_visible("LeaveArea")) {beachBlur = 0;}
	else {beachBlur = 2;}
}

if(!audio_is_playing(amb_Beach)) audio_play_sound(amb_Beach, 0, 1, 1);
audio_sound_gain(amb_Beach, 0, 0);
audio_sound_gain(amb_Beach, 0.4, 2000);