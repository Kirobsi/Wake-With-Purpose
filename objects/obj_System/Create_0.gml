global.keyIndex = [ 38,40,37,39,90,88,13 ];	//array for storing all the 'key codes.' [ Up, Down, Left, Right, Jump, Interact, Pause ]
key_rebind_count = 0;	//variable to track how many keys have been rebound
rebind_mode = false;	//variable to track whether rebinding is active

global.allStrings = load_csv("strings.csv"); //load strings file
global.textSpeed = 3; //Default text scroll speed
create_textbox(1,false,fa_center,true,true,480,260); //create a textbox to tell you how to do settings stuff