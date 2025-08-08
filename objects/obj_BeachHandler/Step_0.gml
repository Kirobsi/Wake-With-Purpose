
#region Fade in

if (fadeFromBlack) {
	if (drawAlpha > 0) {
		drawAlpha -= 0.02;
	}
	else {
		drawAlpha = 0;
		fadeFromBlack = false;
		if (localState == 0) {create_textbox(28);}
	}
}

#endregion


#region Fade out

else if (fadeToBlack) {
	if (drawAlpha < 1) {
		drawAlpha += 0.02;
	}
	else {
		drawAlpha = 1;
		fadeToBlack = false;
		
		if (morningTransition) {
			alarm_set(1, 90);
			calculate_siblif_size(localCalories);
			morningTransition = false;
		}
	}
}

#endregion


#region Fade from Beach to Tent

if (fadeToTent) {
	if (tentAlpha < 1) {
		tentAlpha += 0.02;
	}
	else {
		tentAlpha = 1;
		fadeToTent = false;
	}
}

#endregion


#region Fade from Tent to Beach

if (fadeFromTent) {
	if (tentAlpha > 0) {
		tentAlpha -= 0.2;
	}
	else {
		tentAlpha = 0;
		fadeFromTent = false;
	}
}

#endregion


#region Initial Siblif encounter

if (fadeInSiblif) {
	if (siblifAlpha < 1) {
		siblifAlpha += 0.02;
	}

	else {
		siblifAlpha = 1;
		fadeInSiblif = false;
	}
}

else if (fadeOutSiblif) {
	if (siblifAlpha > 0) {
		siblifAlpha -= 0.02;
	}

	else {
		siblifAlpha = 0;
		fadeOutSiblif = false;
	}
}

if (localState == 1) {
	localState = 2;
/* in case Siblif gets an overworld sprite for her default size,
   I'll have beach 1 be more interactive! but I don't know yet. Best to reserve the space for it */
}

#endregion


#region Cycle 1 End


#region Cash in 1

if (localState == 2 && !firstVisit) {
	/// Determine how many real items the player has
	_filledslots = 10;
	for (var i = 0; i < 10; i++) {
		if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
			_filledslots--;
		}
		else {array_push(slotsToCashIn, i)}
	}
	show_debug_message(_filledslots);
	obj_Crockpot.canInteract = true;
	
	localState = 3;
}

#endregion


#region Fade

if (localState == 3) {
	if (!fadeFromBlack) {
		// create_textbox()
		localState = 4;
	}
}

#endregion


#region Tent interact

if (localState == 4 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
	obj_Crockpot.canInteract = false;
	fadeToTent = true;
	create_textbox(72, false);
}

else if (localState == 5) {
	fadeInSiblif = true;
	create_textbox(77, false);
	localState++;	//to prevent it from spamming textboxes
}

else if (localState == 7) {
	if (_filledslots > 7) {create_textbox(80)}
	else if (_filledslots > 4) {create_textbox(85)}
	else if (_filledslots > 0) {create_textbox(89)}
	localState = 8;
}

else if (localState == 9) {
	fadeFromTent = true;
	fadeOutSiblif = true;
	localState = 10;
}

#endregion


#region Cash in 2

else if (localState == 10) {
	obj_Crockpot.canInteract = true;
	localState = 11;
	fadeToBlack = true;
}

#endregion


#region Early cash in text

else if (localState == 12 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
	fadeToTent = true;
	alarm_set(1,49);
	create_textbox(103, false);
}

else if (localState == 13) {
	fadeInSiblif = true;
	localState++;
}

else if (localState == 14) {
	
}

else if (localState == 15) {
	calculate_siblif_size(localCalories);
	localState++;
}


#endregion


#endregion