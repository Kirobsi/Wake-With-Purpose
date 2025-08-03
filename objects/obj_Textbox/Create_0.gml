#region Initialize Text Stuff

//Current string to draw
currentStringDrawn = "";
pronounChecker = global.allStrings[# 0, dialogueRow]

if (pronounChecker != "") {
	pronounString = global.allStrings[# 1, 14 - real(pronounChecker)];
	characterName = global.allStrings[# 0, 14 - real(pronounChecker)];
}
else {
	pronounString = "";
	characterName = "";
}


//How many characters of the current string should be drawn
currentStringDrawnNo = 1;

#endregion