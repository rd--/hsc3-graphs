'use strict';

var current_hash;

function polyglot_load_syndef_and_play() {
    var fileName = 'db/' + current_hash + '.scsyndef';
    console.log('load_syndef_and_play: filename', current_hash);
    load_array_buffer_and_then(fileName, syndefData => playSyndef(current_hash, syndefData));
}

function polyglot_init() {
    load_json_and_then("json/db.json", function(db) {
        var select = document.getElementById('dbMenu');
        db.forEach(e => select_add_option_to(select, e.hash + e.format, e.header));
    });
    select_on_change('dbMenu', function(value) {
        current_hash = value.split('.')[0];
        console.log(current_hash);
        load_utf8_and_then('db/' + value, function(text) {
            document.getElementById('textView').value = text;
        });
    });
}
