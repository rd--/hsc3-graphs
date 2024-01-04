// TSort ; octaves, either low is left and high is right else both are stereo ; control rate
var tr = Impulse.kr(1, 0);
var freq = { TIRand.kr(1, 7, tr) } ! 2 * [55, 110];
SinOsc.ar([freq, TSort.kr(tr, freq)], 0).sum * 0.1
