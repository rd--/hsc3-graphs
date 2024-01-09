// TLinRandN ; n linearly distributed random numbers every second ; control rate
var n = 12;
var tr = Impulse.kr(1, 0);
var freq = TLinRandN.kr(n, 440, 880, 0, tr);
Splay2.ar(SinOsc.ar(freq, 0) * 0.1)