if (place_meeting(x,y,oPlayer) && canInteract && global.interactKeyPressed && obj_BeachHandler._filledslots > 0) {
	obj_BeachHandler.localCalories = cash_in_food(obj_BeachHandler.slotsToCashIn)
	canInteract = false;
}