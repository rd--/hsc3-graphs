import * as sc from '../www/lib/jssc3/dist/jssc3.js'

let current_hash;

export function load_syndef_and_play() {
    const fileName = `db/${current_hash}.scsyndef`;
    console.log(`load_syndef_and_play: ${fileName}`);
    sc.load_arraybuffer_and_then(fileName, function(syndefData) {
		sc.scSynthEnsure(globalScSynth, function() {
				 sc.playSynDef(globalScSynth, current_hash, syndefData, 1);
		});
	});
}

export function initialise() {
    sc.load_json_and_then("json/db.json", function(db) {
        const select = document.getElementById('polyglotList');
        db.forEach(e => sc.select_add_option_to(select, e.hash + e.format, e.header));
    });
    sc.select_on_change('polyglotList', function(element, value) {
		console.log(`initialise: ${value}`);
        current_hash = value.split('.')[0];
        console.log(current_hash);
        sc.load_utf8_and_then('db/' + value, function(text) {
            document.getElementById('polyglotText').value = text;
        });
    });
}
