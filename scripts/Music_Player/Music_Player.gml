/// @description Plays the desired song with given loop points
/// @returns {Id.Sound} Funny ID to store in a variable
function play_song_home() {
	var homeSong = audio_play_sound(mus_Home, 999, 1, 1);
	audio_sound_loop_start(homeSong,1686859/44100);
	audio_sound_loop_end(homeSong,5801391/44100);
	return homeSong;
}