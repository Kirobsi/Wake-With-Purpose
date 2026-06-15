ds_grid_destroy(global.allStrings);
if (variable_global_exists("miscStrings")) {
	if (ds_exists(global.miscStrings, ds_type_grid)) {
		ds_grid_destroy(global.miscStrings);
	}
}