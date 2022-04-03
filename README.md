# gms1_x-state-machine
a state machine solution for game maker studio 1.x and undertale mod tool using the map data structure and user-defined events for ease of use and readability


PURPOSE:

This was created long after gms 2.3 was released because (believe it or not) I have been working with a lot of gms1.x code, and seeing nested if-else or switch statements everywhere has really annoyed me. So here is a state machine I quickly developed and decided to share with the world. The result is a seperated bunch of states for an object where the code for each state is held in a user defined event. Sure we only have 15 user events, but you can get around that with extra scripts. And sure, having to open multiple files to mess with code handled between multiple states can be tedious, but that's what you sign up for when working with gms1.x :P.
If you have a better solution, please make a pull request, or at least leave me a suggestion


INSTALLATION:
1) download the code file from this repository (linked here for future reference) https://github.com/Zackonark/gms1_x-state-machine

2a) if you are running game maker studio 1.x, right click on the "Scripts" folder in the resource tree, and select "Add Existing Script"

3a) navigate to where you saved the gml file you downloaded from this repo and choose "Open"

4a) PROFIT!

2b) if you're working with UTMT, unfortunately you'll have to create each script resource individually and copy-paste the code from the gml file. Thankfully it can be opened with any text editor, so that's easy. Just note, where it says "#define" is the name of the script

3b) add the script resource to you project, and simply copy-paste everything after "#define" to the name field of the script, and subsequently the code file generated with it with any additional naming conventions UTMT uses, for consistency sake

3c) or name the code whatever you want! It's your project after all lmao

4c) finally copy-paste everything under the "#define" into your new code resource

5c) PROFIT!


EXAMPLE CREATE EVENT:

After you've written a chunk of code like this, the state machine makes as simple as 1 line of code to execute the entire state machine

"
scr_state_machine_init();
scr_state_machine_add("default", scr_user, 0);
scr_state_machine_add("jump", scr_user, 1);
state = "default";
"


EXAMPLE STEP EVENT:

See?? I told you!

"
scr_state_machine_run();
"


A NOTE ON ROOM_END:

If you've included this state machine in an object that has children that are meant to be presistent between rooms, you may want to throw the destroy script call under an if statement checking for if the object is persistent or not. This way you don't lose your state machine between room changes.

"
if(!persistent){
    scr_state_machine_destroy();
}
"
