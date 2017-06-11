/// note_add(time, type, duration);

// Add the TARGET time to the list
ds_list_add(global.notes_ds_time, argument0);


// see note_init() for another example:
ds_list_add(global.notes_ds_type, argument1);
ds_list_add(global.notes_ds_duration, argument2);
