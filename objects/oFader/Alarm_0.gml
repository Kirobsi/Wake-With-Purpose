audio_stop_sound(obj_System.songPlaying);
audio_sound_gain(obj_System.songPlaying, 1, 0);
if (doTravel) {room_goto(targetRoom);}
instance_destroy();