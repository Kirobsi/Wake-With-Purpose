/// @description Show a textbox starting on the specified .CSV row
/// @param {string} text_row The csv row to start on - starts at 0!
/// @param {bool} background_bool Whether or not the text should float with no background
/// @param {Constant.HAlign} justification Which horizontal alignment/justification to use
/// @param {bool} position_override Whether to ignore the textbox's & dynamic positioning
/// @param {real} position_x The text's x position relative to the camera
/// @param {real} position_y The text's y position relative to the camera
function create_textbox(text_row, background_bool = true, justification = fa_left, position_override = false, position_x = 0, position_y = 0){
	instance_create_layer(0, 0, "UI", obj_Textbox, {
		currentString : global.allStrings[# 1, text_row],
		hasBackground : background_bool,
		hAlignment : justification
	})
}