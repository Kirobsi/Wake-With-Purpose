#region Set position properly

x = 149;
y = 392;
visible = true;
image_index *= hasBackground;

#endregion


#region Text Crawl

if (typist.get_state() != 1) {
	if (global.textSpeed != 0) {
		if (global.jumpKeyPressed) {typist.skip(true);}
		
		//play talk sound
		if(!audio_is_playing(snd_Talk))
		{
			if (characterName == "Siblif" || characterName == "???")
			{
				audio_sound_pitch(snd_Talk, random_range(0.6, 0.9));
				audio_play_sound(snd_Talk, 0, 0, global.talkSound);
			}
			
			else
			{
				audio_sound_pitch(snd_Talk, random_range(0.8, 1.2));
				audio_play_sound(snd_Talk, 0, 0, global.talkSound);
			}
		}
	}
	else {
		typist.skip(true);
		global.jumpKeyPressed = false;
	}
}

#endregion


#region Dialogue Options

else if (global.allStrings[# 2, dialogueRow] != "" && canOptions) {	
	for (var i = 1; i * 2 < ds_grid_width(global.allStrings); i++;) {
		if (global.allStrings[# i * 2, dialogueRow] == "") {
			canOptions = false;
			break
		}
		talkOptions = i;
		talkOptionsPosition = i - 1;
	}
	
	canOptions = false;
}

#endregion


#region Press jump to advance

if(global.jumpKeyPressed && canAdvance && (global.gameState <= 1 || typist.get_state() >= 1)) {
    if (talkOptions > 0) {
		dialogueRow = real(global.allStrings[# ((talkOptionsPosition + 1) * 2) + 1, dialogueRow])
		talkOptions = 0;
	} else {dialogueRow ++;}
	
	if (global.allStrings[# 0, dialogueRow] == "goto") {dialogueRow = real(global.allStrings[# 1, dialogueRow])};
	
	if (global.allStrings[# 0, dialogueRow] == "Die") {
		instance_destroy();	//stop if 'end conversation' code
		return	//prevent rest of this code from running
	}
	
	currentString = scribble(global.allStrings[# 1, dialogueRow]);
	characterName = global.allStrings[# 0, dialogueRow];
	
	//figure out name and pronouns
	pronounChecker = global.allStrings[# 0, dialogueRow]

	if (pronounChecker != "") {
		pronounString = global.allStrings[# 1, 16 - real(pronounChecker)];
		characterName = global.allStrings[# 0, 16 - real(pronounChecker)];
	}
	
	if (global.allStrings[# 0, dialogueRow] == "0") {image_index = 2 * hasBackground;}
	else {image_index = 1 * hasBackground;}
	
	talkOptions = 0;
	canOptions = true;
}

if (talkOptions != 0) {
	if (global.upKeyPressed) {talkOptionsPosition++;}
	if (global.downKeyPressed) {talkOptionsPosition--;}
	if (talkOptionsPosition > talkOptions - 1) {talkOptionsPosition = 0;}
	else if (talkOptionsPosition < 0) {talkOptionsPosition = talkOptions - 1;}
}

#endregion