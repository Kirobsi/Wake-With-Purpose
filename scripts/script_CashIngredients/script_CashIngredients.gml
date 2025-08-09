/// @description Function to cash in calories from acquired ingredients
/// @param {array} _inventory The array of items to cash in
function cash_in_food(_inventory) {
	var _localCalories = [0, 0, 0, 0];
	
	for (var i = 0; i < array_length(_inventory); i++) {
		_localCalories[oPlayer.inv[_inventory[i]][2]] += oPlayer.inv[_inventory[i]][3];
		_localCalories[3] += oPlayer.inv[_inventory[i]][3];
	}
		
	instance_create_layer(480, 270, "UI", obj_CalorieTally, {calorieTally : _localCalories[0] + _localCalories[1] + _localCalories[2]});
	show_debug_message(_localCalories)
	return _localCalories;
}



/// @description Function to calculate Siblif's fat stages
/// @param {Array} _localCalories Array of Siblif calories, for code brevity
function calculate_siblif_size(_localCalories) {
	global.siblifCalories = obj_BeachHandler.localCalories;
	//var _currentPoseTier = global.siblifFatStage[3];
	var numStages = [0, 0, 0] //stage # (so, fatness level) of [boobs, belly, butt]
	
	
	#region Calculate what the 'leading' calorie type is
	var sortedCalories = [0, 0, 0]
	array_copy(sortedCalories, 0, _localCalories, 0, 3)
	
	array_sort(sortedCalories, false);
	
	//if the top two are too close, ensure that belly T2 pose is used instead of butt/boob
	global.bellyFallback = false;
	if ((sortedCalories[1] / sortedCalories[0]) >= 0.85) {global.bellyFallback = true;}
	
	var primaryCalories = 0;
	
	for (var i = 0; i < 3; i++) {
		if (sortedCalories[0] == _localCalories[i]) {
			primaryCalories = i
			break
		}
	}
	
	#endregion
	
	
	#region Calculate what the segments should be
	
	for (var i = 0; i < 3; i++) {
		numStages[i] = global.siblifCalories[i] div 1600 //should come out to correct stage?
		
		if (numStages[i] > 5) {numStages[i] = 5} //fat stage cap
		show_debug_message("Fat Stage #" + string(i) + " is: " + string(numStages[i]))
	}
	
	if (global.siblifFatStage[3] == 0 || global.bellyFallback) {
		// Pose 0 = Base
		//		1 = Tier 2, Boob
		//		2 = Tier 2, Belly
		//		3 = Tier 2, Butt
	
		if (_localCalories[primaryCalories] >= 4800) {
			if (global.bellyFallback) {global.siblifFatStage[3] = 2;}
			else {global.siblifFatStage[3] = (primaryCalories + 1);}
		}
	
		if (global.siblifFatStage[3] == 3) {
			global.topSibDraw = spr_SiblifLegs;
			global.secondSibDraw = spr_SiblifBoobs;
			global.thirdSibDraw = spr_SiblifBase;
			global.lastSibDraw = spr_SiblifBelly;
			global.topNum = 2;
			global.twoNum = 0;
			global.threNum = 3;
			global.lastNum = 1;
		}
	}
	
	for (var i = 0; i < 3; i++) {
		global.siblifFatStage[i] = (numStages[i] % 3) + (global.siblifFatStage[3] * 3);
	}
	
	return
}