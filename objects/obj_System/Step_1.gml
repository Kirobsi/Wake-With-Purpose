#region input gatherer

global.upKey = keyboard_check(global.keyIndex[0]);
global.downKey = keyboard_check(global.keyIndex[1]);
global.leftKey = keyboard_check(global.keyIndex[2]);
global.rightKey = keyboard_check(global.keyIndex[3]);
global.jumpKey = keyboard_check(global.keyIndex[4]);
global.jumpKeyPressed = keyboard_check_pressed(global.keyIndex[4]);
global.jumpKeyReleased = keyboard_check_released(global.keyIndex[4]);
global.interactKey = keyboard_check_pressed(global.keyIndex[5]);

#endregion