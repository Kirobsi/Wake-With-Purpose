/// @description Show a textbox starting on the specified .CSV row
/// @param {string} text_row The csv row to start on - starts at 0!
/// @param {bool} _autoRestoreControl Whether to restore Kiwi controls when textbox is destroyed
/// @param {bool} _hasBackground Whether or not the text should float with no background
/// @param {Constant.HAlign} _hAlignment Which horizontal alignment/justification to use
/// @param {bool} _canAdvance Whether the player can advance text with jump input
/// @param {real} position_x The text's x position relative to the camera
/// @param {real} position_y The text's y position relative to the camera
/// @param {real} _width The textbox's width (where it wraps)
function create_textbox(text_row, _autoRestoreControl = true, _hasBackground = true, _hAlignment = fa_left, _canAdvance = true, position_x = 14, position_y = 14, _width = 631) {
	instance_create_layer(0, 0, "UI", obj_Textbox, {
		dialogueRow : text_row,
		currentString : global.allStrings[# 1, text_row],
		autoRestoreControl : _autoRestoreControl,
		hasBackground : _hasBackground,
		hAlignment : _hAlignment,
		canAdvance : _canAdvance,
		xOffset : position_x,
		yOffset : position_y,
		boxWidth : _width
	})
	global.canControlPlayer = false;
}

/// @description Show a textbox starting on the specified other_strings.CSV row
/// @param {string} text_row The csv row to start on - starts at 0!
/// @param {bool} _autoRestoreControl Whether to restore Kiwi controls when textbox is destroyed
/// @param {bool} _hasBackground Whether or not the text should float with no background
/// @param {Constant.HAlign} _hAlignment Which horizontal alignment/justification to use
/// @param {bool} _canAdvance Whether the player can advance text with jump input
/// @param {real} position_x The text's x position relative to the camera
/// @param {real} position_y The text's y position relative to the camera
/// @param {real} _width The textbox's width (where it wraps)
function create_misc_textbox(text_row, _autoRestoreControl = true, _hasBackground = true, _hAlignment = fa_left, _canAdvance = true, position_x = 14, position_y = 14, _width = 631) {
	instance_create_layer(0, 0, "UI", obj_Textbox_Misc, {
		dialogueRow : text_row,
		currentString : global.miscStrings[# 1, text_row],
		autoRestoreControl : _autoRestoreControl,
		hasBackground : _hasBackground,
		hAlignment : _hAlignment,
		canAdvance : _canAdvance,
		xOffset : position_x,
		yOffset : position_y,
		boxWidth : _width
	})
	global.canControlPlayer = false;
}