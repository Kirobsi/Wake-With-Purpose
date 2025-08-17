//Transfer local state to obj_System
global.gameState += incrementGlobalGameState;
show_debug_message("Global game state: " + string(global.gameState))

//Fade out ambience
audio_sound_gain(amb_Beach, 0, 2000);