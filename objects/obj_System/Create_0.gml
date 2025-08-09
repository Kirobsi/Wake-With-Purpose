ini_open("save.ini"); //open save ini for saving/loading

global.gameState = 0; //to track how far through boot you are
global.cycles = 1;	//which cycle the player/game is on
global.volumeLevel = ini_read_real("volume", "level", 20); //default volume of the game
audio_group_set_gain(audiogroup_default, global.volumeLevel / 100, 10) //actually use the volume

//array for storing all the 'key codes.' [ Up, Down, Left, Right, Jump, Interact, Pause ]
//global.keyIndex = [38,
//40,
//37,
//39,
//90,
//88,
//13];
global.keyIndex = [
ini_read_real("buttons", "up", 38),
ini_read_real("buttons", "down", 40),
ini_read_real("buttons", "left", 37),
ini_read_real("buttons", "right", 39),
ini_read_real("buttons", "jump", 90),
ini_read_real("buttons", "interact", 88),
ini_read_real("buttons", "pause", 13)];
key_rebind_count = 0;	//variable to track how many keys have been rebound
rebind_mode = false;	//variable to track whether rebinding is active

global.allStrings = load_csv("strings.csv"); //load strings file
global.textSpeed = ini_read_real("text", "textspeed", 3); //Default text scroll speed
create_textbox(2,false,false,fa_center,true,330,-160,900); //create a textbox for controls adjustment

draw_set_font(MainText);
draw_set_halign(fa_center);
draw_set_colour(c_white);

global.hideInventory = true;
/// Make copy of inventory to store it for different instances of oPlayer
for (var i = 0; i < 10; i++) {
	invCopy[i][0] = "Nothing";	//item name
	invCopy[i][1] = sNone;		//item sprite
	invCopy[i][2] = 3;			//item calorie type
	invCopy[i][3] = 0;			//item calorie count
}

beachState = 0;
caveState = 0;
jungleState = 0;
mountainState = 0;

caveFoodTaken = [0];
jungleFoodTaken = [0];
mountainFoodTaken = [0];

global.siblifFatStage = [0, 0, 0, 0];	//boob, belly, butt, base
global.siblifCalories = [0, 0, 0, 0];	//boob, belly, butt, total

//stupid render order stuff eugh I wasn't thinking about how different poses could mean different layering needs
global.topSibDraw = spr_SiblifBoobs;
global.secondSibDraw = spr_SiblifBelly;
global.thirdSibDraw = spr_SiblifLegs;
global.lastSibDraw = spr_SiblifBase;
global.topNum = 0;
global.twoNum = 1;
global.threNum = 2;
global.lastNum = 3;

homeSongExists = false;