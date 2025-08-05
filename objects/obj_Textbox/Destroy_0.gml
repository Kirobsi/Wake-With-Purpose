global.canControlPlayer = autoRestoreControl;
if (global.allStrings[# 1, dialogueRow] == "localState++") {
	asset_get_index(global.allStrings[# 2, dialogueRow]).localState += 1;
}
else if (global.allStrings[# 1, dialogueRow] == "room_goto") {
	room_goto(asset_get_index(global.allStrings[# 2, dialogueRow]));
}