///@description Clear inventory!
if (invIndex < 10) {
	oPlayer.inv[invIndex][0] = "Nothing";
	oPlayer.inv[invIndex][1] = sNone;
	oPlayer.inv[invIndex][2] = 3;
	oPlayer.inv[invIndex][3] = 0;
	
	obj_System.invCopy[invIndex][0] = "Nothing";
	obj_System.invCopy[invIndex][1] = sNone;
	obj_System.invCopy[invIndex][2] = 3;
	obj_System.invCopy[invIndex][3] = 0;
	alarm_set(2, 13)
	invIndex++;
}