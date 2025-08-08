pushed = false;

attachedgate = yellowgate1;
//set this to the appropriate gate in the creation code

if(obj_CaveHandler.localState == 1)
{
	image_index = 1;
	pushed = true;
	attachedgate.phy_active = false;
}