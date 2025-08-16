if(event_data[? "event_type"] == "sprite event"
&& event_data[? "message"] == "kiwiStep"
&& jumping == false)
{
	audio_play_sound(snd_PlrLand, 0, 0, 0.5, 0, 0.8);
}