;; MouseX ; k random sine tones across stereo field, MouseX selects which to listen to ; https://scsynth.org/t/5722/4
var k = 20;
var mouseX = MouseX(0, k, 0, 0.2);
var select = (0 .. k).collect { :i | mouseX > i };
var note = { [0, 2, 3, 5, 7, 9, 10].atRandom + [48, 60].atRandom } ! k;
var osc = SinOsc(note.MidiCps, 0) * select * 0.05;
Splay2(osc)
