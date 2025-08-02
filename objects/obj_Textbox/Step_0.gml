#region 

x = camera_get_view_x(view_camera[0])
y = camera_get_view_y(view_camera[0])

#endregion

#region Text Crawl

for (var i = 0; i < textSpeed; i++) {
	currentStringDrawn = string_concat(currentStringDrawn, string_char_at(currentString, currentStringDrawnNo));
	currentStringDrawnNo++;
}

#endregion

#region Press Z for Next String

if(keyboard_check_pressed(ord("Z")))
{
    dialogueRow += 1;
	if (global.loadedDialogueStrings[# 0, dialogueRow] == "Die") {instance_destroy()}
    currentString = global.loadedDialogueStrings[# 1, dialogueRow];
    currentStringDrawn = "";
    currentStringDrawnNo = 1;
}

#endregion