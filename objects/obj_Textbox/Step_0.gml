#region Set position properly

x = camera_get_view_x(view_camera[0]) + 150
y = camera_get_view_y(view_camera[0]) + 350


#endregion

#region Text Crawl

for (var i = 0; i < global.textSpeed; i++) {
	currentStringDrawn = string_concat(currentStringDrawn, string_char_at(currentString, currentStringDrawnNo));
	currentStringDrawnNo++;
}

#endregion

#region Press jump to advance

if(global.jumpKeyPressed && canAdvance) {
    dialogueRow += 1;
	if (global.allStrings[# 0, dialogueRow] == "Die") {instance_destroy()}
    currentString = global.allStrings[# 1, dialogueRow];
    currentStringDrawn = "";
    currentStringDrawnNo = 1;
}

#endregion