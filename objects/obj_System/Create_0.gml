global.gameState = 0; //to track how far through boot you are
global.volumeLevel = 30; //default volume of the game
audio_group_set_gain(audiogroup_default, global.volumeLevel / 100, 10) //actually use the volume

global.keyIndex = [ 38,40,37,39,90,88,13 ];	//array for storing all the 'key codes.' [ Up, Down, Left, Right, Jump, Interact, Pause ]
key_rebind_count = 0;	//variable to track how many keys have been rebound
rebind_mode = false;	//variable to track whether rebinding is active

global.allStrings = load_csv("strings.csv"); //load strings file
global.textSpeed = 3; //Default text scroll speed
create_textbox(2,false,false,fa_center,true,true,330,-120,900); //create a textbox for controls adjustment

draw_set_font(MainText);
draw_set_halign(fa_center);
draw_set_colour(c_white);

musicToDelete = "";

global.hideInventory = true;