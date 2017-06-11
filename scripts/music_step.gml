/// music_step();

// Get the current time position of the track music
if (keyboard_check(vk_space)) {
    global.music_time = audio_sound_get_track_position(global.music);
} else {
    global.music_time = audio_position_get(global.music);
}

var list_time = global.notes_ds_time;
var list_type = global.notes_ds_type;
var list_duration = global.notes_ds_duration;

// If there are more notes in the list
if (ds_list_size(list_time) > global.notes_current_index) {
    // Find the target time of the next note
    var time_note_target = ds_list_find_value(list_time, global.notes_current_index);
    
    // and calculate the time that the note needs to be created
    var time_note_creation = time_note_target - global.advance_time;
    
    // Then, if we reach that time
    if (global.music_time >= time_note_creation) {
        // get the note type (image_index)
        var type = ds_list_find_value(list_type, global.notes_current_index);
        var duration = ds_list_find_value(list_duration, global.notes_current_index);
        // create note
        note_create(time_note_creation, time_note_target, type, duration);
        // next note
        global.notes_current_index++;
    }
    
}

