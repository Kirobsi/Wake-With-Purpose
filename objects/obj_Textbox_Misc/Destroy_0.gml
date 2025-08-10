global.canControlPlayer = autoRestoreControl;
global.jumpKeyPressed = !autoRestoreControl;
for (var i = 1; i <= ds_grid_width(global.miscStrings) - 1; i += 2) {
	if (global.miscStrings[# i, dialogueRow] == "localState++") {
		asset_get_index(global.miscStrings[# i + 1, dialogueRow]).localState += 1;
	}
	else if (global.miscStrings[# i, dialogueRow] == "room_goto") {
		fade_to_black(asset_get_index(global.miscStrings[# i + 1, dialogueRow]));
	}
}