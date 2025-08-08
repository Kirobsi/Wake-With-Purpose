randomize();

image_xscale = 2;
image_yscale = 2;

phy_fixed_rotation = true;

jumping = false;
jumpDelay = false;
touchedSpring = false;
holding = false;

#region Initialize Inventory

if (obj_System.invCopy[0][0] != "Nothing") {
	inv = obj_System.invCopy;
}
else {
	for (var i = 0; i < 10; i++) {
		inv[i][0] = "Peach";	//item name
		inv[i][1] = sPeach;		//item sprite
		inv[i][2] = 2;			//item calorie type
		inv[i][3] = 600;			//item calorie count
	}
}

filledslots = 0;

#endregion