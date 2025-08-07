if (array_length(foodTaken) != 0 && deleteFood) {
	show_debug_message(foodTaken)
	for (var i = 1; i < array_length(foodTaken); i++) {
		instance_destroy(foodTaken[i])
	}

	deleteFood = false;
}