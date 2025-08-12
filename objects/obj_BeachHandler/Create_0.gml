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
	beachBlur = 0;
	layer_set_visible("Instances", true);
	layer_set_visible("Instances_1", true);
	
	if (obj_System.songPlaying != mus_Home) {
		obj_System.songPlaying = mus_Home;
		var _song = audio_play_sound(obj_System.songPlaying, true, 1, 1);
		audio_sound_loop_start(_song,1686859/44100);
		audio_sound_loop_end(_song,5801391/44100);
	}
}