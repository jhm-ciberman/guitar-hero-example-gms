/// file_load_string(filename);

var file = file_text_open_read(argument0);
var str = "";
var newline = "
";
while (!file_text_eof(file)) {
    str += file_text_read_string(file) + newline;
    file_text_readln(file);
}
file_text_close(file);
return str;
