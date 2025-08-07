if (array_length(obj_System.jungleFoodTaken) != 0 && deleteFood) {
	show_debug_message(obj_System.jungleFoodTaken)
	for (var i = 1; i < array_length(obj_System.jungleFoodTaken); i++) {
		instance_destroy(obj_System.jungleFoodTaken[i])
	}

	deleteFood = false;
}