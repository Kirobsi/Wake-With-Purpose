global.canControlPlayer = autoRestoreControl;
global.jumpKeyPressed = !autoRestoreControl;
if (global.miscStrings[# 1, dialogueRow] == "localState++") {
	asset_get_index(global.miscStrings[# 2, dialogueRow]).localState += 1;
}
else if (global.miscStrings[# 1, dialogueRow] == "room_goto") {
	room_goto(asset_get_index(global.miscStrings[# 2, dialogueRow]));
}