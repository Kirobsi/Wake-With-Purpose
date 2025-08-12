/// @description Plays the desired song with given loop points
/// @returns {Id.Sound} Funny ID to store in a variable
function play_song_home() {
	var homeSong = audio_play_sound(mus_Home, true, 1, 1);
	audio_sound_loop_start(homeSong,1686859/44100);
	audio_sound_loop_end(homeSong,5801391/44100);
	return homeSong;
}

function play_song_cave() {
	var homeSong = audio_play_sound(mus_Stage, true, 1, 1);
	audio_sound_loop_start(homeSong,0);
	audio_sound_loop_end(homeSong,89.68);
	return homeSong;
}

/// @description Stops any song by muting it
/// @param {Id.Sound} _song The song to stop
function stop_song(_song) {
	audio_sound_gain(_song, 0, 400)
}

/// @description Re-plays any existing song
/// @param {Id.Sound} _song The song to resume
function replay_song(_song) {
	audio_sound_set_track_position(_song, 0)
	audio_sound_gain(_song, global.volumeLevel, 0)
}