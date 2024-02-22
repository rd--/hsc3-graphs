// angry birds ; https://github.com/cianoc/supercollider_fragments
var lfo = LFNoise1.ar([28, 27]) * 400 + 2000;
SinOsc.ar(lfo, 0) * 0.1
