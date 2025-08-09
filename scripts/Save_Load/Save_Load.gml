function save_to_ini(){
	ini_write_real("buttons", "up", global.keyIndex[0]);
	ini_write_real("buttons", "down", global.keyIndex[1]);
	ini_write_real("buttons", "left", global.keyIndex[2]);
	ini_write_real("buttons", "right", global.keyIndex[3]);
	ini_write_real("buttons", "jump", global.keyIndex[4]);
	ini_write_real("buttons", "interact", global.keyIndex[5]);
	ini_write_real("buttons", "pause", global.keyIndex[6]);
	
	ini_write_real("text", "textspeed", global.textSpeed);
	
	ini_write_real("volume", "level", global.volumeLevel);
}