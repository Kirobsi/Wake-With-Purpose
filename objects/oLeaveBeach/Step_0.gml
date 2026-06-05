if (place_meeting(x, y, oPlayer) && layer_get_visible("LeaveArea"))
{
	if (stringnum == 1488 && array_length(obj_System.mountainFoodTaken) >= 29) {
		stringnum = 1489;	//switch to "too few ingredients" string
		cantravel = false;
	}
	
	else if (stringnum == 1490 && array_length(obj_System.jungleFoodTaken) >= 29) {
		stringnum = 1491;
		cantravel = false;
	}
	
	else if (stringnum == 1492 && array_length(obj_System.caveFoodTaken) >= 29) {
		stringnum = 1493;
		cantravel = false;
	}
	
	if (global.interactKeyPressed && !instance_exists(oFader) && cantravel) {
		fade_to_black(travelto);
	}
	
	showtext = true;
}

else
{
	showtext = false;
}