
#region Siblif Calorie Conversions

global.siblifCalories[3] = global.siblifCalories[0] + global.siblifCalories[1] + global.siblifCalories[2];

if (global.siblifCalories[3] >= 6000) {
	global.siblifFatStage[3] = 2;
}

else if (global.siblifCalories[3] >= 4500) {
	global.siblifFatStage[3] = 1;
}

for (var i = 0; i < 3; i++) {
	global.siblifFatStage[i] = floor((global.siblifCalories[i]) / 1500);
}

if (keyboard_check_pressed(ord(1))) {global.siblifFatStage[0] += 1}
if (keyboard_check_pressed(ord(2))) {global.siblifFatStage[1] += 1}
if (keyboard_check_pressed(ord(3))) {global.siblifFatStage[2] += 1}

//show_debug_message(global.siblifCalories)

#endregion


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


#region Fade from Beach to Tent

if (fadeToTent) {
	global.hideInventory = true;
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
		global.hideInventory = false;
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


#region Tent reaction

if (localState == 2 && !fadeFromBlack) {
	// create_textbox()
	localState = 3;
}

#endregion


#region Cash in

if (localState == 3) {
	obj_Crockpot.canInteract = true;
	localState = 4;
	
	/// Determine how many real items the player has
	_filledslots = 10;
	for (var i = 0; i < 10; i++) {
		if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
			_filledslots--;
		}
		else {array_push(slotsToCashIn, i)}
	}
	show_debug_message(_filledslots);
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

else if (localState == 10) {
	obj_Crockpot.canInteract = true;
	localState = 11;
}

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


#endregion


#endregion