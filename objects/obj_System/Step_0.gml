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
			create_textbox(2,false,false,fa_center,true,331,-160,900); //recreate textbox
		}
	}

	else if ((global.interactKeyPressed || keyboard_check_pressed(vk_f8)) && !rebind_mode) {
		rebind_mode = true; //enable rebind mode if not currently active
		global.jumpKeyPressed = true; //advance string
	}

	else if (global.jumpKeyPressed) {
		global.gameState = 0.5;
		instance_destroy(obj_Textbox);
		instance_create_layer(x, y, "UI", obj_TextSpeedKnob)
		create_textbox(10,false,false,fa_center,true,331,-130,900);
	}
}

#endregion


#region Text Speed startup

else if (global.gameState == 0.5) {
	if (global.leftKeyPressed) {global.textSpeed -= 1};
	if (global.rightKeyPressed) {global.textSpeed += 1};
	global.textSpeed = clamp(global.textSpeed, 0, 10);
	
	if (global.jumpKeyPressed) {
		global.gameState = 1;
		instance_destroy(obj_Textbox);
		instance_destroy(obj_TextSpeedKnob);
		instance_create_layer(x, y, "UI", obj_VolumeKnob)
		create_textbox(1,false,false,fa_center,true,331,-130,900);
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
		global.gameState = 9999;
		instance_destroy(obj_Textbox);
		instance_destroy(obj_VolumeKnob);
		global.jumpKeyPressed = false; //prevent next textbox from triggering if spawned on same step
		global.talkSound = 1.8;	//turn on talk sounds
		alarm_set(0, 45);	//show first real textbox
		
		//save all settings to the ini
		save_to_ini();
		ini_close();
	}
}

#endregion


#region Start game

if (!instance_exists(obj_Textbox) && global.gameState == 1.5) {
	global.gameState = 2;
	room_goto(rmBeach);
}

#endregion

#endregion


#region DEBUG FUNCTIONS, REMOVE FOR RELEASE

if (keyboard_check_pressed(vk_f2)) {
	game_restart();
}

else if (keyboard_check_pressed(vk_f3)) {
	instance_destroy(obj_Textbox);
	global.canControlPlayer = true;
	room_goto(stageCave);
}

else if (keyboard_check_pressed(vk_f4)) {
	instance_destroy(obj_Textbox);
	global.canControlPlayer = true;
	room_goto(stageJungle);
}

else if (keyboard_check_pressed(vk_f5)) {
	instance_destroy(obj_Textbox);
	global.canControlPlayer = true;
	room_goto(stageMountain);
}

#endregion