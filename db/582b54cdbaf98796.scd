// random bells, let it run for a while ; https://github.com/cianoc/supercollider_fragments
var partials = 12;
var trigger = Dust.kr(3 / 7);
var f = {
	var env = EnvGen.kr(Env.perc(0, 0.2.rrand(3.0)), trigger, 1.0.rand);
	SinOsc.ar(rrand(50.0, 4000)) * env
};
Pan2.ar(Mix.ar(f.dup(partials)) / partials, 1.0.rand2)
