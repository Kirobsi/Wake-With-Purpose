#region Fade in

if (drawAlpha > 0) {
	drawAlpha -= 0.02;
} else {drawAlpha = 0;}

#endregion


#region

if (fadeInSiblif) {
	if (siblifAlpha < 1) {
		siblifAlpha += 0.02;
	}

	else {
		siblifAlpha = 1;
		fadeInSiblif = false;
		
	}
}

#endregion


//layer_set_visible("Instances",false);
//layer_set_visible("Background",false);
//layer_set_visible("Instances_1",false);