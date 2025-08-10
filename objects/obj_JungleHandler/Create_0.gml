localState = obj_System.jungleState;

if(localState == 1)
{
	
}

foodTaken = obj_System.jungleFoodTaken;
deleteFood = true;

instance_create_layer(x, y, "UI", oTitleCard,
{
	cardtext : "Belly of the Island"
});
fade_from_black(75);