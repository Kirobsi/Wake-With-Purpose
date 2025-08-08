global.canControlPlayer = autoRestoreControl;
global.jumpKeyPressed = !autoRestoreControl;
for (var i = 1; i <= ds_grid_width(global.allStrings) - 1; i += 2) {
	if (global.allStrings[# i, dialogueRow] == "localState++") {
		asset_get_index(global.allStrings[# i + 1, dialogueRow]).localState++;
	}
	else if (global.allStrings[# i, dialogueRow] == "room_goto") {
		fade_to_black(asset_get_index(global.allStrings[# i + 1, dialogueRow]))
	}
}