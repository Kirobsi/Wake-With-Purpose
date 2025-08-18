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

else if (global.jumpKeyPressed) {fadeOut = true;}

if (fadeOut) {
	if (drawAlpha < 1) {
		drawAlpha = funnyCounter / 180;
		funnyCounter++;
	}
	else {
		drawAlpha = 1;
		fadeOut = false;
		alarm_set(0, 40);
	}
}