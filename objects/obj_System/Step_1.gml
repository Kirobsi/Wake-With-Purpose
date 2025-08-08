#region input gatherer

global.upKey = keyboard_check(global.keyIndex[0]);
global.upKeyPressed = keyboard_check_pressed(global.keyIndex[0]);
global.downKey = keyboard_check(global.keyIndex[1]);
global.downKeyPressed = keyboard_check_pressed(global.keyIndex[1]);
global.leftKey = keyboard_check(global.keyIndex[2]);
global.leftKeyPressed = keyboard_check_pressed(global.keyIndex[2]);
global.rightKey = keyboard_check(global.keyIndex[3]);
global.rightKeyPressed = keyboard_check_pressed(global.keyIndex[3]);
global.jumpKey = keyboard_check(global.keyIndex[4]);
global.jumpKeyPressed = keyboard_check_pressed(global.keyIndex[4]);
global.jumpKeyReleased = keyboard_check_released(global.keyIndex[4]);
global.interactKey = keyboard_check_pressed(global.keyIndex[5]);
global.interactKeyPressed = keyboard_check_pressed(global.keyIndex[5]);
global.pauseKeyPressed = keyboard_check_pressed(global.keyIndex[6]);

#endregion