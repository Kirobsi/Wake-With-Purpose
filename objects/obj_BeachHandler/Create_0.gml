visible = true;
drawAlpha = 1;
fadeFromBlack = true;
fadeToBlack = false;
morningTransition = false;

tentAlpha = 0;
fadeToTent = false;
fadeFromTent = false;

//pull local state from obj_System
localState = obj_System.beachState;

siblifAlpha = 0;
fadeInSiblif = false;
fadeOutSiblif = false;

_filledslots = -1;
slotsToCashIn = [];
localCalories = [0, 0, 0, 0]; //boob, belly, butt

firstVisit = false;

if (localState == 0) {
	alarm_set(0, 90)
	layer_set_visible("SiblifForeground",true);
	beachBlur = 1;
	firstVisit = true;
}

else if (localState > 0) {
	beachBlur = 0;
	layer_set_visible("Instances", true);
	layer_set_visible("Instances_1", true);
	
	if (!obj_System.homeSongExists) {
		obj_System.homeSong = play_song_home();
		obj_System.homeSongExists = true;
	} else {replay_song(obj_System.homeSong);}
}