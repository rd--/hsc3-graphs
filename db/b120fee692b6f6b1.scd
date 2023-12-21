// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) L43
var f = { arg i;
	var x = Impulse.ar(1, i / 10) + Impulse.ar(0, 0);
	var o = LFSaw.ar(#[102, 101], 0);
	var d = 1 / Latch.ar(1.015 ** Sweep.ar(0, 1) * 64 % 1 + 1 * 200, x);
	Pluck.ar(o, x, 1, d, 4, 0.2)
};
f.dup(10).mean
