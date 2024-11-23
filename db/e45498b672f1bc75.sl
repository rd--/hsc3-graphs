/* MouseX ; k random sine tones across stereo field, MouseX selects which to listen to ; https://scsynth.org/t/5722/4 */
let k = 20;
let mouseX = MouseX(0, k, 0, 0.2);
let select = 0:k.collect { :i | mouseX > i };
let note = { [0, 2, 3, 5, 7, 9, 10].atRandom + [48, 60].atRandom } ! k;
let osc = SinOsc(note.MidiCps, 0) * select * 0.05;
osc.Splay
