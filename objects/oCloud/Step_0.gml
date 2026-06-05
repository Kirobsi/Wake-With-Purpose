x += 1;

if(bbox_left > room_width) {
	show_debug_message("esgt")
	instance_destroy();
}

if (bbox_left == 0) {
	with(oCloudGenerator) {
		alarm_set(0, irandom_range(60, 480));
	}
}