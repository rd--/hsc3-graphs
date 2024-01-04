// TSort ; octaves, either low is left and high is right else both are stereo ; audio rate
var tr = Impulse.ar(1, 0);
var freq = { TIRand.ar(1, 7, tr) } ! 2 * [55, 110];
SinOsc.ar([freq, TSort.ar(tr, freq)], 0).sum * 0.1
