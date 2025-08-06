global.canControlPlayer = autoRestoreControl;
global.jumpKeyPressed = !autoRestoreControl;
for (var i = 1; i <= ds_grid_width(global.allStrings); i += 2) {
	if (global.allStrings[# i, dialogueRow] == "localState++") {
		show_debug_message("localstate = " + string(obj_BeachHandler.localState))
		asset_get_index(global.allStrings[# i + 1, dialogueRow]).localState += 1;
		show_debug_message("localstate = " + string(obj_BeachHandler.localState))
	}
	else if (global.allStrings[# i, dialogueRow] == "room_goto") {
		room_goto(asset_get_index(global.allStrings[# i + 1, dialogueRow]));
	}
}