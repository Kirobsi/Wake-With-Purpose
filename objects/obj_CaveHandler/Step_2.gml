if (array_length(obj_System.caveFoodTaken) != 0 && deleteFood) {
	show_debug_message(obj_System.caveFoodTaken)
	for (var i = 1; i < array_length(obj_System.caveFoodTaken); i++) {
		instance_destroy(obj_System.caveFoodTaken[i])
	}

	deleteFood = false;
}