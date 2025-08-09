
#region Fade in

if (fadeFromBlack) {
	if (drawAlpha > 0) {
		drawAlpha -= 0.02;
	}
	else {
		drawAlpha = 0;
		fadeFromBlack = false;
		if (localState == 0 && global.gameState == 2) {create_textbox(28);}
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
	}
}

#endregion


#region Fade from Beach to Tent

if (fadeToTent) {
	if (tentAlpha < 1) {
		tentAlpha += 0.03;
	}
	else {
		tentAlpha = 1;
		fadeToTent = false;
	}
}

#endregion


#region Fade from Tent to Beach

else if (fadeFromTent) {
	if (tentAlpha > 0) {
		tentAlpha -= 0.03;
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
		siblifAlpha += 0.03;
	}

	else {
		siblifAlpha = 1;
		fadeInSiblif = false;
	}
}

else if (fadeOutSiblif) {
	if (siblifAlpha > 0) {
		siblifAlpha -= 0.03;
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

if (global.gameState == 3) {
	#region Cash in 1

	if (localState == 0) {
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
	
		localState = 1;
	}

	#endregion


	#region Fade

	if (localState == 1) {
		if (!fadeFromBlack) {
			// create_textbox()
			localState = 2;
		}
	}

	#endregion


	#region Tent interact

	if (localState == 2 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
		if (global.NoFoodMode) {create_textbox(199)}
		obj_Crockpot.canInteract = false;
		fadeToTent = true;
		create_textbox(72, false);
	}

	else if (localState == 3) {
		fadeInSiblif = true;
		create_textbox(77, false);
		localState++;	//to prevent it from spamming textboxes
	}

	else if (localState == 5) {
		localState = 6;
		if (_filledslots > 0) {global.NoFoodMode = false;}
		
		if (_filledslots > 7) {create_textbox(80)}
		else if (_filledslots > 4) {create_textbox(85)}
		else if (_filledslots > 0) {create_textbox(89)}
		else {
			create_textbox(179)
			global.NoFoodMode = true;
		}
	}

	else if (localState == 7) {
		fadeFromTent = true;
		fadeOutSiblif = true;
		localState = 8
		if (global.NoFoodMode) {
			global.gameState = 2;
			layer_set_visible("LeaveArea", true);
		}
	}

	#endregion


	#region Cash in 2

	else if (localState == 8) {
		obj_Crockpot.canInteract = true;
		localState = 9;
	}

	#endregion


	#region Early cash in text

	else if (localState == 10 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
		fadeToTent = true;
		alarm_set(1,49);
		create_textbox(103, false);
	}

	else if (localState == 11) {
		fadeInSiblif = true;
		localState++;
	}

	else if (localState == 13) {
		fadeToBlack = true;
		alarm_set(1, 75);
		localState++;
	}

	else if (localState == 15) {
		create_textbox(114, false/*, false, fa_center, true, 330, -140, 600*/);
		localState = 16;
		calculate_siblif_size(localCalories);
	}
	
	#endregion
	
	
	#region Night & Morning Section

	else if (localState == 17) {
		alarm_set(1, 180);
		localState++;
	}

	else if (localState == 19) {
		create_textbox(128, false);
		localState++;
	}

	else if (localState == 21) {
		fadeFromBlack = true;
		alarm_set(1, 90)
		localState++;
	}

	else if (localState == 23) {
		if (global.siblifFatStage[0] > 0) {create_textbox(167, false);}			//boob
		else if (global.siblifFatStage[1] > 0) {create_textbox(132, false);}	//belly
		else if (global.siblifFatStage[2] > 0) {create_textbox(162, false);}	//butt
		else {create_textbox(201, false);}
		localState++;
	}

	else if (localState == 25) {
		fadeOutSiblif = true;
		alarm_set(1, 75)
		localState++;
	}

	else if (localState == 27) {
		layer_set_visible("LeaveArea", true);
		fadeFromTent = true;
		global.canControlPlayer = true;
		
		for (var i = 0; i < 3; i++) {
			if (global.siblifFatStage[i] > 0) {
				localState = 28
				break
			}
		}
		
		localState++;
	}
	
	else if (localState == 28 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
		fadeToTent = true;
		fadeInSiblif = true;
		create_textbox(245, false);
		localState = 24;
	}
	
	else if (localState == 29 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
		fadeToTent = true;
		fadeInSiblif = true;
		create_textbox(247, false);
		localState = 24;
	}


	#endregion


	#region Later cash in text
	
	else if (localState == 9 && place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
		fadeToTent = true;
		alarm_set(1,49);
		create_textbox(177, false);
		localState = 10;
	}
	
	#endregion
}

#endregion