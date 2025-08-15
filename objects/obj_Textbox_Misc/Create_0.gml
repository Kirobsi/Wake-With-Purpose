#region Initialize Text Stuff

currentStringDrawn = "";
pronounChecker = global.miscStrings[# 0, dialogueRow]

if (pronounChecker != "") {
	pronounString = global.miscStrings[# 1, 11 - real(pronounChecker)];
	characterName = global.miscStrings[# 0, 11 - real(pronounChecker)];
}
else {
	pronounString = "";
	characterName = "";
}

if (global.miscStrings[# 0, dialogueRow] == "0") {image_index = 2;}
else {image_index = 1;}

canOptions = true;
talkOptions = 0;
talkOptionsPosition = 0;
talkOptHeight = 38;
//talkOptGap = 4;


//How many characters of the current string should be drawn
currentStringDrawnNo = 1;

#endregion