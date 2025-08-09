localState = obj_System.mountainState;

if(localState == 1)
{
	
}

foodTaken = obj_System.jungleFoodTaken;
deleteFood = true;

instance_create_layer(x, y, "UI", oTitleCard,
{
	cardtext : "Topping Mountain"
});
fade_from_black(75);