// TLinRand ; n linearly distributed random numbers every second ; audio rate
var n = 12;
var tr = Impulse.ar(1, 0);
var freq = { TLinRand.ar(440, 880, 0, tr) } ! n;
Splay.ar(SinOsc.ar(freq, 0) * 0.1)
