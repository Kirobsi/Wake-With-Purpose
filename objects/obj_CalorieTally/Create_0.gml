internalState = 0;
rectangleAlpha = 0;
risingCalories = 0;
funnyCounter = 0;
alarm_set(0,25);

text1 = false;
text2 = false;
text3 = false;
rankText = "";

fadeOutRectangle = false;
global.canControlPlayer = false;

if (os_type == os_android) {
	global.horVisible = false;
	global.actVisible = false;
}

invIndex = 0;
