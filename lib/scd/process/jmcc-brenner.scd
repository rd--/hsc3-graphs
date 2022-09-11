// seating music for wayne allen brenner ; jmcc ; 2000
var scale = [0, 2, 4, 5, 7, 9, 11];
var root = 3;
var funca = { // struck string
	var freq = (scale.choose + [24, 36, 48, 60, 72, 84].choose + root).midiCps;
	var env = Decay2.kr(Impulse.kr([0.125, 0.25, 0.375, 0.5, 0.75, 1, 1.5, 2, 3, 4].choose, 0) * 0.05, 0.005, 0.05);
	var exc = { BrownNoise.ar * env }.dup(2);
	var res = RingzBank.ar(
		exc,
		Array.series(16, freq, freq),
		Array.geom(16, 1, 0.7.rrand(0.999)),
		{ 0.1.rrand(2.5) }.dup(16),
		exc
	);
	(res * 0.1).softClip
};
var funcb = { // metallic
	var env = Decay2.kr(Impulse.kr([0.125, 0.25, 0.375, 0.5, 0.75, 1, 1.5, 2].choose, 0, 0.04), 0.005, 0.05);
	var exc = { BrownNoise.ar * env }.dup(2);
	(RingzBank.ar(exc, { 8000.0.linrand + 60 }.dup(16), nil, { 0.1.rrand(2) }.dup(16)) * 0.1).softClip
};
var funcc = { // whistle
	var freq = (scale.choose + #[84, 96].choose + root).midiCps;
	var env = 0.05 * 0.max(SinOsc.kr(0.125.exprand(0.5), 2 * pi.rand));
	var exc = { BrownNoise.ar * env }.dup(2);
	(RingzBank.ar(exc, [freq], nil, [0.3]) * 0.1).softClip
};
var funcd = { // bowed string
	var freq = (scale.choose + #[24, 36, 48, 60, 72, 84].choose + root).midiCps;
	var env = 0.007 * 0.max(LFNoise1.kr(0.125.exprand(0.5)) * 0.6 + 0.4);
	var exc = { BrownNoise.ar * env }.dup(2);
	(RingzBank.ar(
		exc,
		Array.series(12, freq, freq),
		Array.geom(12, 1, 0.7.rrand(0.9)),
		{ 1.0.rrand(3.0) }.dup(12)
	) * 0.1).softClip
};
var funce = { // wind metals
	var n = 6;
	var base = 60.exprand(4000);
	var range = 500.0.rrand(8000.0);
	var env = 0.007 * 0.max(LFNoise1.kr(0.125.exprand(0.5)) * 0.75 + 0.25);
	var exc = { BrownNoise.ar * env }.dup(2);
	(RingzBank.ar(exc, { range.linrand + base}.dup(n), nil, { 0.1.rrand(2) }.dup(n)) * 0.1).softClip
};
var funcf = { // wind chords
	var n = 5;
	var env = 0.007 * 0.max(LFNoise1.kr(0.125.exprand(0.5)) * 1.25 - 0.25);
	var exc = { BrownNoise.ar * env }.dup(2);
	(RingzBank.ar(
		exc,
		{(scale.choose + [36, 48, 60, 72, 84].choose + root).midiCps}.dup(n),
		nil,
		{ 0.1.rrand(2) }.dup(n)
	) * 0.1).softClip
};
var funcs = [
	[30, [funca, funca, funca, funca, funca, funca, funcb, funcb, funcc, funcd]],
	[24, [funcc, funcd, funcc, funcd, funcb]],
	[30, [funca, funca, funca, funca, funca, funca, funcb, funcb, funcc, funcd]],
	[24, [funce]],
	[30, [funca, funca, funca, funca, funca, funca, funcb, funcb, funcc, funcd]],
	[24, [funcf]]
].rotate(6.rand);
var count = 0;
{
	var reps, flist;
	count.postln;
	#reps, flist = funcs.wrapAt(count);
	root = 3.rrand(6);
	Texture.overlapRoutine({
		var snd = flist.choose.value;
		[DelayN.ar(snd.first, 0.04, 0.04.rand), snd.second].scramble;
	}, 32, 4, 10, 2, maxRepeats: reps);
	count = count + 1;
	2.seconds.wait
}.fork
