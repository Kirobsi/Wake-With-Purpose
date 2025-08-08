/// @description Function to cash in calories from acquired ingredients
/// @param {array} _inventory The array of items to cash in
function cash_in_food(_inventory) {
	var _localCalories = [0, 0, 0];
	
	for (var i = 0; i < array_length(_inventory); i++) {
		_localCalories[oPlayer.inv[_inventory[i]][2]] += oPlayer.inv[_inventory[i]][3];
	}
		
	instance_create_layer(480, 270, "UI", obj_CalorieTally, {calorieTally : _localCalories[0] + _localCalories[1] + _localCalories[2]});
		
	return _localCalories;
}


/// @description Function to calculate Siblif's fat stages
function calculate_siblif_size() {
	for (var i = 0; i < 3; i++) {
		if (global.siblifCalories[i] >= 1600) {
			
			#region If initial pose base:
			
			if (global.siblifFatStage[3] == 0) {
				global.siblifFatStage[i]++;
			}
			
			#endregion
		}
	}
	
	return
}