#region Fade in

if (fadeFromBlack) {
	if (drawAlpha > 0) {
		drawAlpha -= 0.02;
	}
	else {
		drawAlpha = 0;
		fadeFromBlack = false;
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
		if (localState == 0) {alarm_set(1, 30);}
	}
}

if (localState == 1) {
	localState = 2;
/* in case Siblif gets an overworld sprite for her default size,
   I'll have beach 1 be more interactive! but I don't know yet. Best to reserve the space for it */
}

#endregion


#region Cycle 1 End


#region Cook food / results screen
if (localState == 2) {localState = 3;}


#region Tent reaction

if (localState == 3 && !fadeFromBlack) {
	// create_textbox()
	localState++;
}

#endregion


#region Tent interact

if (localState == 4 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
	
	/// Determine how many real items the player has
	var _filledslots = oPlayer.filledslots;
	var _lostSlots = 0;
	var _slotsToCashIn = [];
	for (var i = 0; i < 10; i++) {
		if (oPlayer.inv[i][0] == "Lost") {
			_filledslots--;
			_lostSlots++;
		}
		else if (oPlayer.inv[i][0] == "Nothing") {_filledslots--}
		else {array_push(_slotsToCashIn, i)}
	}
	
	fadeToTent = true;
	create_textbox(72, false);
}

else if (localState == 5) {
	fadeInSiblif = true;
	create_textbox(76, false);
	localState++;
}

#endregion