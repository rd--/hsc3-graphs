// dark sea horns (jl)
var x = LocalIn.ar(2, 0);
var a = (SinOsc.ar(65, x * LFNoise1.ar(0.1) * 3) * LFNoise1.ar(3) * 6).tanh;
9.do {
	a = AllpassL.ar(a, 0.3, { 0.2.rand + 0.1 } ! 2, 5)
};
a = a.tanh;
a * 0.1 <! LocalOut.ar(a);
