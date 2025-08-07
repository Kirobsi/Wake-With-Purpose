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