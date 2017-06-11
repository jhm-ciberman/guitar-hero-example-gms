global.archivo = "file.json";

var json = json_decode(global.archivo);
if (json == -1) {
    show_debug_message("ERROR CARGANDO EL ARCHIVO JSON");
    exit;
}
var notes = json[? "notes"];



var numb = ds_list_size(times);

global.cant = numb;//Cantidad total de notas

global.cantverdes = 0;
global.cantrojas = 0;
global.cantazules = 0;
global.cantamarillas = 0;

// Carga las listas
var times = notes[? "times"];
var durations = notes[? "durations"];
var types = notes[? "types"];

// Para cada nota 
for (var i = 0; i < numb; i++ ) {
    //Suma 1 al tipo de nota porque en el archivo los tipos se guardan 
    // de 0 a 3, y en el juego se guardan de 1 a 4
    var type = types[| i] + 1; 
    var time = times[| i];
    var duration = durations[| i];
    
    global.posicionnotas[i] = type;
    
    switch (type) { //1= verde, 2= Roja, 3=azul, 4=amarilla
        case 1: 
            global.posicionesverdes[global.cantverdes++] = time;
            notasverdesduracion[global.cantverdes] = duration;
            break;
        case 2: 
            global.posicionesrojas[global.cantrojas++] = time;
            notasrojasduracion[global.cantrojas] = duration;
            break;
        case 3: 
            global.posicionesazules[global.cantazules++] = time;
            notasazulesduracion[global.cantazules] = duration;
            break;
        case 4: 
            global.posicionesamarillas[global.cantamarillas++] = time;
            posicionesamarillas[global.cantamarillas] = duration;
            break;
        default:
            //show_debug_message("Nota desconocida");
    }
    
}
// Destruye el mapa
ds_map_destroy(json);
