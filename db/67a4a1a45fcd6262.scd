// FM7
var freq = LFNoise0.kr(3).exprange(200, 310);
var ctls = [
	[freq, 0, 1],
	[freq, 0, 1],
	[LFNoise2.kr(0.5).exprange(3, 80), 0, 1],
	[LFNoise2.kr(0.5).exprange(3, 800), 0, 1],
	[LFNoise2.kr(0.5).exprange(3, 800), 0, 1],
	[LFNoise2.kr(0.5).exprange(0.3, 10), 0, 1]
];
var x = MouseX.kr(0, 3, 0, 0.2);
var mods = { { LFNoise1.kr(0.5).max(0) }.dup(6) * x }.dup(6);
FM7.ar(ctls, mods).keep(2) * -12.dbamp
