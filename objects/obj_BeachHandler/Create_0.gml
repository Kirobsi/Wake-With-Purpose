visible = true;
drawAlpha = 1;
fadeFromBlack = true;

tentAlpha = 0;
fadeToTent = false;
fadeFromTent = false;

//pull local state from obj_System
localState = obj_System.beachState;

siblifAlpha = 0;
fadeInSiblif = false;

if (localState == 0) {
	alarm_set(0, 120)
	layer_set_visible("SiblifForeground",true);
	beachBlur = 1;
}

else if (localState > 0) {
	beachBlur = 0;
	play_song_home();
	layer_set_visible("Instances", true);
	layer_set_visible("Instances_1", true);
}