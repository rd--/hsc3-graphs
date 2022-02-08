// phase modulation, all three ; https://github.com/cianoc/supercollider_fragments
var car = LFNoise0.kr([9, 9], 300, 700);
var mod = LFNoise0.kr([9, 9], 500, 700);
var ix = LFNoise0.kr([9, 9], 6, 12);
PMOsc.ar(car, mod, ix, mul: 0.15)
