visible = true;
drawAlpha = 1;

//pull local state from obj_System
localState = obj_System.beachState;

siblifAlpha = 0;
fadeInSiblif = false;

if (global.cycles == 1 && global.gameState == 2) {
	alarm_set(0, 120)
	//layer_set_visible("SiblifBackground",true);
	//layer_set_visible("SiblifForeground",true);
}