if (keyboard_check_pressed(vk_anykey) && key_rebind_count < 7 && rebind_mode) {
	global.keyIndex[key_rebind_count] = keyboard_key;
	key_rebind_count++;
	if (key_rebind_count > 6)
	{
		key_rebind_count = 0;
		rebind_mode = false;
	}
}

else if (keyboard_check_pressed(vk_space)) {rebind_mode = true}

jumpKeyPressed = keyboard_check_pressed(global.keyIndex[4]);