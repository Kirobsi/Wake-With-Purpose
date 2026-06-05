if (fadeIn) {
	if (drawAlpha > 0) {
		drawAlpha = funnyCounter / 180;
		funnyCounter--;
	}
	else {
		drawAlpha = 0;
		fadeIn = false;
		funnyCounter = 0;
	}
}

else if (global.jumpKeyPressed) {
	promptAlpha = 1;
	alarm_set(0, 120);
}

if (fadeOut) {
	if (promptAlpha > 0) {
		promptAlpha = funnyCounter / 45;
		funnyCounter--;
	}
	else {
		promptAlpha = 0;
		fadeOut = false;
	}
	//if (drawAlpha < 1) {
	//	drawAlpha = funnyCounter / 180;
	//	funnyCounter++;
	//}
	//else {
	//	drawAlpha = 1;
	//	fadeOut = false;
	//	alarm_set(0, 40);
	//}
}