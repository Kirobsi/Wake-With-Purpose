/// @description Show a textbox starting on the specified .CSV row
/// @param {string} text_row The csv row to start on - starts at 0!
/// @param {bool} _hasBackground Whether or not the text should float with no background
/// @param {Constant.HAlign} _hAlignment Which horizontal alignment/justification to use
/// @param {bool} _canAdvance Whether the player can advance text with jump input
/// @param {bool} _positionOverride Whether to ignore the textbox's & dynamic positioning
/// @param {real} position_x The text's x position relative to the camera
/// @param {real} position_y The text's y position relative to the camera
function create_textbox(text_row, _hasBackground = true, _hAlignment = fa_left, _canAdvance = true, _positionOverride = false, position_x = 7, position_y = 7) {
	instance_create_layer(0, 0, "UI", obj_Textbox, {
		dialogueRow : text_row,
		currentString : global.allStrings[# 1, text_row],
		hasBackground : _hasBackground,
		hAlignment : _hAlignment,
		canAdvance : _canAdvance,
		positionOverride : _positionOverride,
		xOffset : position_x,
		yOffset : position_y
	})
}