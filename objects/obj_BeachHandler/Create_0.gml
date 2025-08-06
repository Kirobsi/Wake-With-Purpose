visible = true;
drawAlpha = 1;

//pull local state from obj_System
localState = obj_System.beachState;

siblifAlpha = 0;
fadeInSiblif = false;

if (localState == 0) {
	alarm_set(0, 120)
	layer_set_visible("SiblifBackground",true);
	layer_set_visible("SiblifForeground",true);
}

else if (localState > 0) {
	layer_set_visible("Instances", true);
	layer_set_visible("Background", true);
	layer_set_visible("Instances_1", true);
}

sprite_set_bbox(spr_beachBackground, 602, 224, 776, 310);