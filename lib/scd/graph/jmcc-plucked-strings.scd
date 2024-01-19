// plucked strings (jmcc)
var i = {
	var s0 = Impulse.ar(2.rrand(2.2), 0, 0.3);
	var s1 = Dust.ar(0.5) * 0.3;
	var s2 = Impulse.ar(SinOsc.kr(0.05.rrand(0.15), 0.rrand(pi * 2)) * 5 + 5.2, 0) * 0.3;
	[s0, s1, s2].choose
};
var s = {
	var dt = { 1 / 60.rrand(90).floor.midicps }.value;
	var t = Decay.ar(i.value, 0.1) * PinkNoise.ar * 0.1;
	Pan2.ar(CombL.ar(t, dt, dt, 4), -1.rrand(1), 1)
};
Mix.fill(5, s)

