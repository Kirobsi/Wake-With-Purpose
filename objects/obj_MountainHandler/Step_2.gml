if (array_length(obj_System.mountainFoodTaken) != 0 && deleteFood) {
	show_debug_message(obj_System.mountainFoodTaken)
	for (var i = 1; i < array_length(obj_System.mountainFoodTaken); i++) {
		instance_destroy(obj_System.mountainFoodTaken[i])
	}

	deleteFood = false;
}