{- MouseX ; as above with reset ; rate is slower the more tones are audible -}
let k = 20;
let mouseX = MouseX(0, k, 0, 0.2);
let reset = LfNoise2(k * 2 / (mouseX + 1)).kr;
let select = (0 .. k).collect { :i | mouseX > i };
let note = { Choose(reset, [0 2 3 5 7 9 10]) + Choose(reset, [48 60]) } ! k;
let osc = SinOsc(note.MidiCps, 0) * select * 0.05;
osc.Splay
