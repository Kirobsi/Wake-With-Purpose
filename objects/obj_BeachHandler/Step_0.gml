
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


#region Siblif Fade

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

#endregion


#region Cycle 1 Start

if (global.gameState == 2) {
	if (localState == 1) {
		create_textbox(28, false);
		localState++;
	}

	else if (localState == 2) {
		localState = 3;
	/* in case Siblif gets an overworld sprite for her default size,
	   I'll have beach 1 be more interactive! but I don't know yet. Best to reserve the space for it */
	}
}

#endregion


#region Cycle 1 End / Cycle 2 Start

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
		show_debug_message("Number of filled inv slots: " + string(_filledslots));
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
		if (global.NoFoodMode && _filledslots == 0) {create_textbox(199)}
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
		
		if (_filledslots >= 7) {create_textbox(80)}
		else if (_filledslots >= 4) {create_textbox(85)}
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
		primaryCalories = calculate_siblif_size(global.siblifCalories);
		beachBlur = 0;
	}
	
	#endregion
	
	
	#region Night & Morning Section

	else if (localState == 17) {
		alarm_set(1, 150);
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
		if (global.siblifFatStage[primaryCalories] > 0) {
			switch (primaryCalories) {
			case 0:
				create_textbox(167, false);	//boob
			break;
			
			case 1:
				create_textbox(132, false); //belly
			break;
			
			case 2:
				create_textbox(162, false); //butt
			break;
			}
		}
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
		global.cycles = 2;
		
		for (var i = 0; i < 3; i++) {
			if (global.siblifFatStage[i] > 0) {
				localState = 28;
				break;
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


#region Cycle 2 End / Cycle 3 Start

else if (global.gameState == 4) {
	
	switch (localState)
	{
		
		case 0: //cash in
			
			/// Determine how many real items the player has
			_filledslots = 10;
			for (var i = 0; i < 10; i++) {
				if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
					_filledslots--;
				}
				else {array_push(slotsToCashIn, i)}
			}
			show_debug_message("Number of filled inv slots: " + string(_filledslots));
			obj_Crockpot.canInteract = true;
			
			localState++;
			
		break;
		
		
		case 2: //Initiate tent&textbox post-cooking
		
			if (place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
				fadeToTent = true;
				alarm_set(1,49);
				
				//Figure out if Siblif gained weight last night
				global.dialogueFlag1 = false;
				for (var i = 0; i < 3; i++) {
					if (global.siblifCalories[i] >= 9000) {
						global.dialogueFlag1 = true;
						break;
					}
				}
				
				if (global.dialogueFlag1) {create_textbox(316, false);}
				else if (_filledslots >= 7) {create_textbox(252, false);}
				else {create_textbox(285, false);}
			}
		
		break;
		
		
		case 3: //show Siblif
			
			fadeInSiblif = true;
			localState++;
			
		break;
		
		
		case 5: //Next textbox
		
			if (global.dialogueFlag1) {create_textbox(400, false);}
			else {create_textbox(278, false);}
			fadeToBlack = true;
			localState++;
		
		break;
		
		
		case 7: //Sleepyzone
			
			fadeToBlack = true;
			alarm_set(1, 150);
			global.cycles = 3;
			
			//If she's already M.F. fat, go to that 'branch'
			if (global.dialogueFlag1) {
				fadeOutSiblif = true;
				localState = 16;				
				break;
			}
			
			localState++;
			
		break;
		
		
		case 9:
			
			primaryCalories = calculate_siblif_size(global.siblifCalories);
			beachBlur = 0;
			
			create_textbox(413, false);
			localState = 10;
				
		break;
		
		
		case 11:
			
			fadeFromBlack = true;
			if (primaryCalories == 0) {create_textbox(416, false);}
			else if (primaryCalories == 1) {create_textbox(434, false);}
			else {create_textbox(443, false);}
			localState++;
			
		break;
		
		
		case 13:
		
			fadeOutSiblif = true;
			alarm_set(1, 75);
			localState++;
		
		break;
		
		
		case 15:
		
			fadeFromTent = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			localState = 999;
		
		break;
		
		
		case 17:
		
			primaryCalories = calculate_siblif_size(global.siblifCalories);
			beachBlur = 0;
			
			//Find out if Siblif is in a T2 pose
			if (global.siblifFatStage[3] > 0) {global.dialogueFlag2 = true;}
			else {global.dialogueFlag2 = false;}
			
			fadeFromBlack = true;
			create_textbox(469, false);
			localState++;
		
		break;
		
		
		case 19:
		
			fadeInSiblif = true;
			
			if (!global.dialogueFlag2) {create_textbox(632, false);}
			else {
				//boob
				if (global.siblifFatStage[3] == 1) {create_textbox(475, false);}
				
				//belly
				else if (global.siblifFatStage[3] == 2) {create_textbox(543, false);}
				
				//butt
				else {create_textbox(587, false);}
			}
			
			localState++;
		
		break;
		
		
		case 21:
		
			fadeOutSiblif = true;
			fadeFromTent = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			localState++;
		
		break;
		
	}
	
}

#endregion


#region Cycle 3 End / Cycle 4 Start

else if (global.gameState == 5) {

	switch (localState)
	{
		
		case 0: //cash in
			
			/// Determine how many real items the player has
			_filledslots = 10;
			for (var i = 0; i < 10; i++) {
				if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
					_filledslots--;
				}
				else {array_push(slotsToCashIn, i)}
			}
			show_debug_message("Number of filled inv slots: " + string(_filledslots));
			obj_Crockpot.canInteract = true;
			
			localState++;
			
		break;
		
		
		case 2: //Initiate tent&textbox post-cooking
		
			if (place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
				fadeToTent = true;
				fadeInSiblif = true;
				
				if (!global.dialogueFlag1) {create_textbox(885, false);}
				else {create_textbox(722, false);}
			}
		
		break;
		
		
		case 3:
			
			fadeToBlack = true;
			if (!global.dialogueFlag1) {create_textbox(400, false);}
			else {create_textbox(881, false);}
			localState++;
			
		break;

		
		case 5:
			
			localState++;
			alarm_set(1, 95);
			fadeOutSiblif = true;
			
		break;
		
		
		case 7:
		
			primaryCalories = calculate_siblif_size(global.siblifCalories);
			beachBlur = 0;
			
			//Find out if Siblif is in a T2 pose
			if (global.siblifFatStage[3] > 0) {global.dialogueFlag2 = true;}
			else {global.dialogueFlag2 = false;}
			
			if (global.dialogueFlag2 && global.dialogueFlag1) {
				localState = 12;
				fadeInSiblif = true;
				siblifAlpha = 1;
				break;
			}
			
			fadeFromBlack = true;
			create_textbox(469, false);
			localState++;
		
		break;
		
		
		case 9:
		
			fadeInSiblif = true;
			
			if (!global.dialogueFlag2) {create_textbox(632, false);}
			else {
				//boob
				if (global.siblifFatStage[3] == 1) {create_textbox(475, false);}
				
				//belly
				else if (global.siblifFatStage[3] == 2) {create_textbox(543, false);}
				
				//butt
				else {create_textbox(587, false);}
			}
			
			localState++;
		
		break;
		
		
		case 11:
		
			fadeOutSiblif = true;
			fadeFromTent = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			global.cycles++;
			localState = 999;
		
		break;
		
		
		case 12:
		
			create_textbox(930, false);
			localState++;
		
		break;
		
		
		case 14:
		
			fadeFromBlack = true;
			
			//boob
			if (global.siblifFatStage[3] == 1) {create_textbox(937, false);}
				
			//belly
			else if (global.siblifFatStage[3] == 2) {create_textbox(995, false);}
				
			//butt
			else {create_textbox(1054, false);}
			
			localState++;
		
		break;
		
		
		case 16:
		
			fadeOutSiblif = true;
			alarm_set(1, 50);
			localState++;
		
		break;
		
		
		case 18:
		
			create_textbox(992, false);
			localState++;
		
		break;
		
		
		case 20:
		
			fadeFromTent = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			global.cycles++;
			localState = 999;
		
		break;
	}
	
}

#endregion


#region Cycle 4 End / Cycle 5 Start

else if (global.gameState == 6) {

	switch (localState)
	{
		
		case 0: //cash in
			
			/// Determine how many real items the player has
			_filledslots = 10;
			for (var i = 0; i < 10; i++) {
				if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
					_filledslots--;
				}
				else {array_push(slotsToCashIn, i)}
			}
			show_debug_message("Number of filled inv slots: " + string(_filledslots));
			obj_Crockpot.canInteract = true;
			
			localState++;
			
		break;
		
		
		case 2: //Initiate tent&textbox post-cooking
		
			if (place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
				fadeToTent = true;
				fadeInSiblif = true;
				
				//Find out if Siblif is in a T2 pose
				if (global.siblifFatStage[3] > 0) {global.dialogueFlag2 = true;}
				else {global.dialogueFlag2 = false;}
				
				if (!global.dialogueFlag2) {create_textbox(722, false);}
				else {create_textbox(1118, false);}
			}
		
		break;
		
		
		case 3:
			
			fadeToBlack = true;
			
			alarm_set(1,25);
			localState++;
			
		break;
		
		
		case 5:
		
			beachBlur = 0;
			if (!global.dialogueFlag2) {create_textbox(881, false);}
			else {create_textbox(1194, false);}
			localState++;
		
		break;
		
		
		case 7:
		
			alarm_set(1,120);
			localState++;
		
		break;
		
		
		case 9:
		
			primaryCalories = calculate_siblif_size(global.siblifCalories);
			
			if (!global.dialogueFlag2 && global.siblifFatStage[3] > 0) {
				localState = 14;
				break;
			}
			
			else {create_textbox(1204, false);}
			fadeFromBlack = true;
			localState++;
		
		break;
		
		
		case 11:
		
			if (primaryCalories == 0) {create_textbox(1238, false)}			//boob
			else if (primaryCalories == 1) {create_textbox(1244, false)}	//belly
			else {create_textbox(1248, false)}								//butt
			localState++;
		
		break;
		
		
		case 13:
		
			fadeFromTent = true;
			fadeOutSiblif = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			global.cycles++;
			localState = 999;
		
		break;
		
		
		case 14:
		
			create_textbox(930, false);
			localState++;
		
		break;
		
		
		case 16:
		
			fadeFromBlack = true;
			
			//boob
			if (global.siblifFatStage[3] == 1) {create_textbox(937, false);}
				
			//belly
			else if (global.siblifFatStage[3] == 2) {create_textbox(995, false);}
				
			//butt
			else {create_textbox(1054, false);}
			
			localState++;
		
		break;
		
		
		case 18:
		
			fadeOutSiblif = true;
			alarm_set(1, 50);
			localState++;
		
		break;
		
		
		case 20:
		
			create_textbox(992, false);
			localState++;
		
		break;
		
		
		case 22:
		
			fadeFromTent = true;
			global.canControlPlayer = true;
			layer_set_visible("LeaveArea", true);
			global.cycles++;
			localState = 999;
		
		break;
	}
	
}

#endregion


#region Cycle 5 End

else if (global.gameState == 7) {

	switch (localState)
	{
		
		case 0: //cash in
			
			/// Determine how many real items the player has
			_filledslots = 10;
			for (var i = 0; i < 10; i++) {
				if (oPlayer.inv[i][0] == "Lost" || oPlayer.inv[i][0] == "Nothing") {
					_filledslots--;
				}
				else {array_push(slotsToCashIn, i)}
			}
			show_debug_message("Number of filled inv slots: " + string(_filledslots));
			obj_Crockpot.canInteract = true;
			
			localState++;
			
		break;
		
		
		case 2: //Initiate tent&textbox post-cooking
		
			if (place_meeting(0,0,oPlayer) && global.interactKeyPressed && global.canControlPlayer) {
				fadeToTent = true;
				fadeInSiblif = true;
				
				show_debug_message(global.siblifCalories)
				for (var i = 0; i < 4; i++) {
					global.siblifCalories[i] += (dayCalories[i] * 0.5);
				}
				show_debug_message(global.siblifCalories)
				
				create_textbox(1268, false);
			}
		
		break;
		
		
		case 3:
			
			if (global.siblifFatStage[3] == 1) {create_textbox(1323, false)}			//boob
			else if (global.siblifFatStage[3] == 2) {create_textbox(1361, false)}		//belly
			else {create_textbox(1372, false)}											//butt
			localState++;
			
		break;
		
		
		case 5:
		
			alarm_set(1, 120);
			fadeToBlack = true;
			localState++;
		
		break;
		
		
		case 7:
		
			primaryCalories = calculate_siblif_size(global.siblifCalories);
			create_textbox(1383, false);
			localState++;
		
		break;
		
		
		case 9:
		
			fadeFromBlack = true;
			alarm_set(1, 150);
			localState++;
		
		break;
		
		
		case 11:
		
			if (primaryCalories == 0) {create_textbox(1387, false)}			//boob
			else if (primaryCalories == 1) {create_textbox(1410, false)}	//belly
			else {create_textbox(1432, false)}								//butt
			localState++;
		
		break;
		
		
		case 13:
		
			fadeToBlack = true;
			alarm_set(1, 120);
			stop_song(obj_System.songPlaying);
			localState++;
		
		break;
		
		
		case 15:
		
			localState++;
			create_textbox(462,false,false,fa_center,true,331,-160,900);
		
		break;
		
		
		case 17:
			
			if (global.siblifCalories[3] >= 27000) {
				localState = 18;
				alarm_set(1, 60);
				break;
			}
			else {create_textbox(1466, false);}
			localState++;
			
		break;
		
		
		case 19:
		
			create_textbox(1454,false,false,fa_center,true,331,-160,650);
			localState++;
		
		break;
		
		
		case 21:
		
			alarm_set(1, 75);
			localState++;
		
		break;
		
		
		case 23:
		
			room_goto(rmEndScreen);
		
		break;
	}
	
}

#endregion