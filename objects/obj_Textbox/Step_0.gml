#region Set position properly

x = camera_get_view_x(view_camera[0]) + 150;
y = camera_get_view_y(view_camera[0]) + 350;
visible = true;
if (global.allStrings[# 0, dialogueRow] == "0") {image_index = 2;}
else {image_index = 1;}
image_index *= hasBackground;

#endregion


#region Text Crawl

if (currentStringDrawnNo < string_length(currentString) + 1) {
	for (var i = 0; i < global.textSpeed; i++) {
		currentStringDrawn = string_concat(currentStringDrawn, string_char_at(currentString, currentStringDrawnNo));
		currentStringDrawnNo++;
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

else if(global.jumpKeyPressed && canAdvance) {
    if (talkOptions > 0) {
		dialogueRow = real(global.allStrings[# ((talkOptionsPosition + 1) * 2) + 1, dialogueRow])
		talkOptions = 0;
	} else {dialogueRow ++;}
	if (global.allStrings[# 0, dialogueRow] == "Die") {
		instance_destroy();	//stop if 'end conversation' code
		return	//prevent rest of this code from running
	}
		
	else if (global.allStrings[# 0, dialogueRow] == "goto") {dialogueRow = real(global.allStrings[# 1, dialogueRow])};
	
	currentString = global.allStrings[# 1, dialogueRow];
    currentStringDrawn = "";
    currentStringDrawnNo = 1;
	characterName = global.allStrings[# 0, dialogueRow];
	
	//figure out name and pronouns
	pronounChecker = global.allStrings[# 0, dialogueRow]

	if (pronounChecker != "") {
		pronounString = global.allStrings[# 1, 14 - real(pronounChecker)];
		characterName = global.allStrings[# 0, 14 - real(pronounChecker)];
	}
	
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