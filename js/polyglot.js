import * as sc from '../www/lib/jssc3/dist/jssc3.js'

let current_hash;

export function load_syndef_and_play() {
    const fileName = `db/${current_hash}.scsyndef`;
    console.log(`load_syndef_and_play: ${fileName}`);
    sc.fetch_arraybuffer_then(fileName, function(syndefData) {
		sc.scSynthEnsure(globalScSynth, function() {
				 sc.playSynDef(globalScSynth, current_hash, syndefData, 1);
		});
	});
}

export function initialise() {
    sc.fetch_json_then("json/db.json", function(db) {
        const select = document.getElementById('polyglotList');
        db.forEach(e => sc.select_add_option_to(select, e.hash + e.format, e.header));
    });
    sc.select_on_change('polyglotList', function(element, value) {
		console.log(`initialise: ${value}`);
        current_hash = value.split('.')[0];
        console.log(current_hash);
        sc.fetch_utf8_then('db/' + value, function(text) {
            document.getElementById('polyglotText').value = text;
        });
    });
}
