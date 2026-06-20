#region Set position properly

x = 149;
y = 391;
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

else if (global.miscStrings[# 2, dialogueRow] != "" && canOptions) {	
	if (os_type == os_android) {global.verVisible = true;}
	
	for (var i = 1; i * 2 < ds_grid_width(global.miscStrings); i++;) {
		if (global.miscStrings[# i * 2, dialogueRow] == "") {
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
		dialogueRow = real(global.miscStrings[# ((talkOptionsPosition + 1) * 2) + 1, dialogueRow])
		talkOptions = 0;
		if (os_type == os_android) {global.verVisible = false;}
	} else {dialogueRow ++;}
	
	if (global.miscStrings[# 0, dialogueRow] == "goto") {dialogueRow = real(global.miscStrings[# 1, dialogueRow])};
	
	if (global.miscStrings[# 0, dialogueRow] == "Die") {
		instance_destroy();	//stop if 'end conversation' code
		return	//prevent rest of this code from running
	}
	
	currentString = scribble(global.miscStrings[# 1, dialogueRow]);
	characterName = global.miscStrings[# 0, dialogueRow];
	
	//figure out name and pronouns
	pronounChecker = global.miscStrings[# 0, dialogueRow]

	if (pronounChecker != "") {
		pronounString = global.miscStrings[# 1, 11 - real(pronounChecker)];
		characterName = global.miscStrings[# 0, 11 - real(pronounChecker)];
	}
	
	if (global.miscStrings[# 0, dialogueRow] == "0") {image_index = 2;}
	else {image_index = 1;}
	
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