/// music_init(advance_time);

// The music sound game maker's ID
global.music = undefined;

// Time in seconds of the audio_sound_get_track_position(song);
global.music_time = 0;

// current index of the note that will be created
// that is, the next note index.
global.notes_current_index = 0;

// This is the time that the note will 
// take to fall to the bottom of the screen
global.advance_time = argument0; 

