localState = obj_System.caveState;

if(localState == 1)
{
	//Allow passage to phase 2 area
	instance_destroy(oCavePhaseBlocker);
}

deleteFood = true;

instance_create_layer(x, y, "UI", oTitleCard,
{
	cardtext : "The cave where you make a girl's butt larger"
});
fade_from_black(120);