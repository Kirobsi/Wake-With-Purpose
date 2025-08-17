#region Initialize Text Stuff

currentStringDrawn = "";
pronounChecker = global.allStrings[# 0, dialogueRow]

if (pronounChecker != "") {
	pronounString = global.allStrings[# 1, 16 - real(pronounChecker)];
	characterName = global.allStrings[# 0, 16 - real(pronounChecker)];
}
else {
	pronounString = "";
	characterName = "";
}

if (global.allStrings[# 0, dialogueRow] == "0") {image_index = 2 * hasBackground;}
else {image_index = 1 * hasBackground;}


canOptions = true;
talkOptions = 0;
talkOptionsPosition = 0;
talkOptHeight = 38;
//talkOptGap = 4;


//How many characters of the current string should be drawn
currentStringDrawnNo = 1;

#endregion