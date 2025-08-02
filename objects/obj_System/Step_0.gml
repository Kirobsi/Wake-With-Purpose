#region Startup

#region Volume setting

if (startupState == 0) {
	if (global.leftKey) {global.volumeLevel -= 0.01};
	if (global.rightKey) {global.volumeLevel += 0.01};
	global.volumeLevel = clamp(global.volumeLevel, 0, 1);
	if (global.jumpKeyPressed) {
		startupState++;
		instance_destroy(obj_Textbox);
		create_textbox(2,false,fa_center,true,true,330,-90); //create a textbox for controls adjustment
		global.jumpKeyPressed = false; //prevent next textbox from triggering if spawned on same step
	}
}

#endregion

#region Rebind setting

if (startupState == 1) {
	//if a key is pressed and they're being rebound,
	if (keyboard_check_pressed(vk_anykey) && rebind_mode) {
		global.keyIndex[key_rebind_count] = keyboard_key; //set pressed key to its respective input
		key_rebind_count++; //increment index counter
		global.jumpKeyPressed = true; //advance string
		if (key_rebind_count > 6) //if it's too high, reset & turn off rebind mode
		{
			key_rebind_count = 0;
			rebind_mode = false;
			instance_destroy(obj_Textbox);
			create_textbox(2,false,fa_center,true,true,330,-90); //recreate textbox
		}
	}

	else if (keyboard_check_pressed(vk_space) && !rebind_mode) {
		rebind_mode = true; //enable rebind mode if not currently active
		global.jumpKeyPressed = true; //advance string
	}

	else if (global.jumpKeyPressed) {
		startupState++;
		instance_destroy(obj_Textbox);
	}
}

#endregion

#endregion