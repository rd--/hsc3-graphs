// TSort - octaves, either low is left and high is right else both are stereo
var tr = Impulse.kr(1, 0);
var freq = #[55, 110] * { TIRand.kr(1, 7, tr) }.dup(2);
SinOsc.ar([freq, TSort.kr(tr, freq)], 0).sum * 0.1
