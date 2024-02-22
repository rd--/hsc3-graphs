// worth experimenting with ; https://github.com/cianoc/supercollider_fragments
var trigger = Dust.kr(3/7);
var fund = 100.rrand(400);
var f = { |counter|
	var partial = counter + 1;
	var env = EnvGen.kr(Env.adsr(0, 0, 1.0, 5.0), trigger, 1 / partial);
	var amp = 0.max(LFNoise1.kr(5.0.rrand(12.0)));
	Pan2.ar(SinOsc.ar(fund * partial) * env * amp, 1.0.rand2)
};
Mix.ar(Array.fill(16, f)) * 0.5
