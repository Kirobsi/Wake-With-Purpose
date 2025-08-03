#region Set position properly

x = camera_get_view_x(view_camera[0]) + 150;
y = camera_get_view_y(view_camera[0]) + 350;
visible = true;

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

//else if (global.allStrings[# 2, dialogueRow])


#region Press jump to advance

if(global.jumpKeyPressed && canAdvance) {
    dialogueRow ++;
	if (global.allStrings[# 0, dialogueRow] == "Die") {
		instance_destroy();	//stop if 'end conversation' code
		return
	}
	if (global.allStrings[# 0, dialogueRow] == "goto") {dialogueRow = real(global.allStrings[# 1, dialogueRow])};
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
}

#endregion