#region Startup

#region Controls startup

if (global.gameState == 0) {
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
			create_textbox(2,false,false,fa_center,true,true,330,-120,900); //recreate textbox
		}
	}

	else if (global.interactKeyPressed && !rebind_mode) {
		rebind_mode = true; //enable rebind mode if not currently active
		global.jumpKeyPressed = true; //advance string
	}

	else if (global.jumpKeyPressed) {
		global.gameState = 1;
		instance_destroy(obj_Textbox);
		instance_create_layer(x, y, "UI", obj_VolumeKnob)
		create_textbox(1,false,false,fa_center,true,true,330,-90,900);
	}
}

#endregion


#region Volume startup

else if (global.gameState == 1) {
	if (global.leftKeyPressed) {global.volumeLevel -= 1};
	if (global.rightKeyPressed) {global.volumeLevel += 1};
	if (global.upKeyPressed) {global.volumeLevel += 10};
	if (global.downKeyPressed) {global.volumeLevel -= 10};
	global.volumeLevel = clamp(global.volumeLevel, 0, 100);
	audio_group_set_gain(audiogroup_default,global.volumeLevel / 100,10)
	if (global.jumpKeyPressed) {
		global.gameState = 2;
		instance_destroy(obj_Textbox);
		instance_destroy(obj_VolumeKnob);
		global.jumpKeyPressed = false; //prevent next textbox from triggering if spawned on same step
		alarm_set(0,45)
	}
}

#endregion

#endregion



#region DEBUG FUNCTIONS, REMOVE FOR RELEASE

if (keyboard_check_pressed(vk_f1)) {
	create_textbox(16);
}

else if (keyboard_check_pressed(vk_f2)) {
	game_restart();
}

else if (keyboard_check_pressed(vk_f3)) {
	room_goto(stageCave);
}

#endregion