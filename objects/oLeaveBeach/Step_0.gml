if (place_meeting(x, y, oPlayer))
{
	if (stringnum == 1488 && array_length(obj_System.mountainFoodTaken) >= 29) {stringnum = 1489;}
	else if (stringnum == 1490 && array_length(obj_System.jungleFoodTaken) >= 29) {stringnum = 1491;}
	else if (stringnum == 1492 && array_length(obj_System.caveFoodTaken) >= 29) {stringnum = 1493;}
	
	else if (global.interactKeyPressed && !instance_exists(oFader)) {
		fade_to_black(travelto);
	}
	
	showtext = true;
}

else
{
	showtext = false;
}