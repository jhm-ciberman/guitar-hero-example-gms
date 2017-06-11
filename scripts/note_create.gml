/// note_create( start_time, target_time, image_index, duration );


var o = instance_create(room_width/2, 0, obj_note);
o.image_index = argument2;
o.image_speed = 0;

var center = room_width/2;
var width = room_width/2;
var xx = center - width/2 + argument2 * width/6; // xleft + type * 60

o.x_start = xx;
o.y_start = 0;
o.x_end = xx;
o.y_end = global.target_y;
o.scale_start = 1;
o.scale_end = 1;
o.time_start = argument0;
o.time_end = argument1;
o.duration = argument3;

