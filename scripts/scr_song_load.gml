/// scr_song_load(filename);

//global.archivo = "file.json";

var jsonstring = file_load_string(argument0);

var json = json_decode(jsonstring);
if (json == -1) {
    show_debug_message("ERROR CARGANDO EL ARCHIVO JSON");
    exit;
}
show_debug_message(json_encode(json));
// Mapa con los datos de las notas
var notes = json[? "notes"];
// Carga las listas
var times = notes[? "times"];
var durations = notes[? "durations"];
var types = notes[? "types"];

var size = ds_list_size(times)
global.cant = size;//Cantidad total de notas

global.cantverdes = 0;
global.cantrojas = 0;
global.cantazules = 0;
global.cantamarillas = 0;



// Para cada nota 
for (var i = 0; i < size; i++ ) {
    //Suma 1 al tipo de nota porque en el archivo los tipos se guardan 
    // de 0 a 3, y en el juego se guardan de 1 a 4
    var type = types[| i] + 1; 
    var time = times[| i];
    var duration = durations[| i];
    
    global.posicionnotas[i] = type;
    
    switch (type) { //1= verde, 2= Roja, 3=azul, 4=amarilla
        case 1: 
            global.posicionesverdes[global.cantverdes++] = time; //en milisegundos
            notasverdesduracion[global.cantverdes] = duration / room_speed; //en steps
            break;
        case 2: 
            global.posicionesrojas[global.cantrojas++] = time; //en milisegundos
            notasrojasduracion[global.cantrojas] = duration / room_speed; //en steps
            break;
        case 3: 
            global.posicionesazules[global.cantazules++] = time; //en milisegundos
            notasazulesduracion[global.cantazules] = duration / room_speed; //en steps
            break;
        case 4: 
            global.posicionesamarillas[global.cantamarillas++] = time; //en milisegundos
            posicionesamarillas[global.cantamarillas] = duration / room_speed; //en steps
            break;
        default:
            //show_debug_message("Nota desconocida");
    }
    
    //Este codigo es parte del ejemplo de GuitarHero,
    //Para TU juego, deberías comentar esta lineas
    note_add(time/1000, type, duration/1000);
}
// Destruye el mapa
ds_map_destroy(json);



