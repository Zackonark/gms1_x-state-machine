#define scr_state_machine_init
//create the data structure and the current state variable
//NOTE: RUN scr_state_machine_destroy() IN DESTROY EVENTS TO PREVENT MEMORY LEAKS
//to change states, simply set the state variable to the name of the state you wish to run

///@usage               scr_state_machine_init();

states = ds_map_create();
state = "";


#define scr_state_machine_add
//add a new state to the state machine registry

///@usage               scr_state_machine_add(name, script_ID, [argument]);
///@param name
///@param script
///@param [optional_arg]

if(ds_exists(states, ds_type_map)){
    var array;
    array[0] = argument[1];
    
    if(argument_count == 3){
        array[1] = argument[2];
    }
    
    ds_map_add(states, argument[0], array);
}


#define scr_state_machine_run
//run the state machine

///@usage               scr_state_machine_run();

if(ds_exists(states, ds_type_map)){
    var func = ds_map_find_value(states, state);
    
    if(array_length_1d(func) == 2){
        script_execute(func[0], func[1]);
    }
    
    else{
        script_execute(func[0]);
    }
}


#define scr_state_machine_destroy
//destroys the satte machine
//NOTE: THIS MUST BE RUN IN THE room_end, game_end, and destroy EVENTS TO PREVENT MEMORY LEAKS

///@usage               scr_state_machine_destroy();

if(ds_exists(states, ds_type_map)){
    ds_map_destroy(states);
}


#define scr_user
//script that calls user defined events
//here so user defined events are usuable in the state machine

///@usage               scr_user();

event_user(argument[0]);


