/// audio_position_init();
/*
    Init system
*/
enum _audio_pos {
    song_id,
    time,
    last_valid_time,
    last_generated_time,
}

global._sound_pos_map = ds_map_create();

