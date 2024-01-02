(* MouseX ; as above with reset ; rate is slower the more tones are audible *)
var k = 20;
var mouseX = MouseX(0, k, 0, 0.2);
var reset = LfNoise2(k * 2 / (mouseX + 1)).kr;
var select = (0 .. k).collect { :i | mouseX > i };
var note = { Choose(reset, [0 2 3 5 7 9 10]) + Choose(reset, [48 60]) } ! k;
var osc = SinOsc(note.MidiCps, 0) * select * 0.05;
osc.Splay