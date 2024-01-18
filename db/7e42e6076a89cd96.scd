// TExpRandN ; n exponentially distributed random numbers every second ; audio rate
var n = 12;
var tr = Impulse.ar(1, 0);
var freq = TExpRandN.ar(n, 440, 880, tr);
Splay.ar(SinOsc.ar(freq, 0) * 0.1)
