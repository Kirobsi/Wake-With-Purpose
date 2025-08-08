//show_debug_message(alarm[0])

//fade in rectangle
if (internalState < 3) {
	if (rectangleAlpha < 0.625) {rectangleAlpha += 0.025;}
	else {rectangleAlpha = 0.625;}
}

//fade out rectangle
if (fadeOutRectangle) {
	if (rectangleAlpha > 0) {
		rectangleAlpha -= 0.012;
	} else {
		rectangleAlpha = 0;
	}
}

//show congrats
if (internalState == 1) {
	text1 = true;
	alarm_set(0,59);
	internalState++;
}

//begin showing risingCalories / tally
else if (internalState == 3) {
	internalState++;
	text2 = true;
	funnyCounter = 1;
	alarm_set(2, 1)
}

else if (internalState == 4) {
	funnyCounter++;
	risingCalories = floor(calorieTally * funnyCounter / 120);
	if (risingCalories == calorieTally) {internalState++;}
}

else if (internalState == 5) {
	if (alarm[0] == -1) {
		alarm_set(0, 59);
	}
	if (calorieTally >= 2200) {
		rankText = "That shark will be a whale before you know it!"
	}
	else if (calorieTally >= 1600) {
		rankText = "This'll do a number on her waistline!";
	}
	else if (calorieTally >= 1200) {
		rankText = "This might fatten her up."
	}
	else if (calorieTally >= 800) {
		rankText = "She won't be gaining much today..."
	} else {rankText = "Did you really try...?"}
}

else if (internalState == 6) {
	internalState++;
	text3 = true;
}

else if (internalState == 7 && global.jumpKeyPressed) {
	internalState++;
}

else if (internalState == 8) {
	alarm_set(1, 10);
	internalState++;
}

else if (internalState == 9 && alarm[0] == -1) {alarm_set(0,19);}

else if (internalState == 10 && alarm[0] == -1) {
	alarm_set(0,19);
	text1 = false;
}

else if (internalState == 11 && alarm[0] == -1) {
	alarm_set(0,19);
	text2 = false;
	global.canControlPlayer = true;
}

else if (internalState == 12) {
	if (global.cycles == 1 && obj_BeachHandler.localState < 10) {
		obj_BeachHandler.localState = 12;
	}
	else if (global.cycles == 1) {
		obj_BeachHandler.localState = 15;
	}
	
	instance_destroy();
}