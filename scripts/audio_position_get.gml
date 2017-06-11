#define audio_position_get
///audio_position_get(audio_id);
/*
    audio_id: The id of the track
*/
var map = global._sound_pos_map;
if (!ds_map_exists(map, argument0)) {
    var a;
    a[_audio_pos.song_id] = argument0;
    a[_audio_pos.time] = undefined;
    a[_audio_pos.last_valid_time] = undefined;
    a[_audio_pos.last_generated_time] = undefined;
    ds_map_add(map, argument0, a);
    
} else {
    var a = ds_map_find_value(map, argument0);
}

var song_id = a[_audio_pos.song_id];
var time = audio_sound_get_track_position(song_id);
var last_valid_time = a[_audio_pos.last_valid_time];
if (time != last_valid_time) {
    a[@ _audio_pos.last_generated_time] = time;
    a[@ _audio_pos.last_valid_time] = time; 
    return time;
} else {
    var lgt = a[_audio_pos.last_generated_time]; 
    lgt = lgt + delta_time/1000000;
    a[@ _audio_pos.last_generated_time] = lgt;
    return lgt;
}



#define audio_position_delete
/// audio_position_delete(songID)
/*
    Removes a song from the system, when is not needed anymore.
*/

ds_map_delete(global._sound_pos_map, argument0);