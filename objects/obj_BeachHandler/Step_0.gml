#region Fade in

if (drawAlpha > 0) {
	drawAlpha -= 0.02;
} else {drawAlpha = 0;}

#endregion


#region Initial Siblif encounter

if (fadeInSiblif && localState == 0) {
	if (siblifAlpha < 1) {
		siblifAlpha += 0.02;
	}

	else {
		siblifAlpha = 1;
		fadeInSiblif = false;
		alarm_set(1, 30);
	}
}

else if (localState == 1) {
	localState = 2;
/* in case Siblif gets an overworld sprite for her default size,
   I'll have beach 1 be more interactive! but I don't know yet. Best to reserve the space for it */
}

#endregion


#region Cycle 1 End



#endregion


//layer_set_visible("Instances",false);
//layer_set_visible("Background",false);
//layer_set_visible("Instances_1",false);