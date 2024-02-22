// decaying gongs ; https://github.com/cianoc/supercollider_fragments
var dur = 6;
var base = Rand(40, 60);
var trig = SinOsc.ar(1/10, pi);
var f = { |detune|
	{ |count|
		var thisDur = dur * 0.5.rrand(1.0);
		var aenv = EnvGen.kr(Env.perc(0, thisDur), trig);
		var fenv = EnvGen.kr(Env.new([1, 1, 0, 1], [0.05 * thisDur, 0.95 * thisDur, 0]), trig);
		var freq = base * (count + 1 + detune.rand) * LFNoise1.kr(10, mul: 0.02 * fenv, add: 1);
		Pan2.ar(SinOsc.ar(freq, mul: aenv), [1, -1].choose * fenv)
	}
};
(Mix.fill(15, f.value(0)) + Mix.fill(15, f.value(0.1))) * 0.05
