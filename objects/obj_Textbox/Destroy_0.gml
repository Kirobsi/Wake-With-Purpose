global.canControlPlayer = autoRestoreControl;
global.jumpKeyPressed = !autoRestoreControl;
for (var i = 1; i <= ds_grid_width(global.allStrings) - 1; i += 2) {
	if (ds_grid_get(global.allStrings, i, dialogueRow) == "localState++") {
		asset_get_index(ds_grid_get(global.allStrings, i + 1, dialogueRow)).localState++;
	}
	else if (ds_grid_get(global.allStrings, i, dialogueRow) == "room_goto") {
		fade_to_black(asset_get_index(ds_grid_get(global.allStrings, i + 1, dialogueRow)))
	}
}