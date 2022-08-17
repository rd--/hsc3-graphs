// chrd (rd)
{
	var chrd = {
		arg m;
		var ds = 3;
		var d = [5, 4, 5, 7, 4, 5] * ds;
		var freq = XLn.kr(m, m + Rand.ir(0.05, 0.5), d).midiCps;
		var env = Sine.kr(1, d.maxItem) * Rand.ir(0.005, 0.01);
		var pos = XLn.kr(Rand.ir(-1, 1), Rand.ir(-1, 1), d);
		var osc = SinOsc.ar(freq, 0);
		Pan2.ar(osc, pos, env).sum
	};
	var scale = [0, 2, 4, 5, 7, 9, 11];
	var octaves = [4, 5, 6, 7];
	var mnn = scale.collect({ arg n; octaves.collect({ arg o; n + (o * 12) }) }).flatten;
	var chd = { mnn.choose }.dup(6);
	{ chrd.value(chd) }.dup(9).sum
}.overlap(21, 0, 3, 2)

// chrd (rd) ; keywords ; list comprehension
Texture.overlapRoutine(
	newEventFunc: {
		var chrd = {
			arg m;
			var ds = 3;
			var d = [5, 4, 5, 7, 4, 5] * ds;
			var freq = XLn.kr(start: m, end: m + Rand.ir(lo: 0.05, hi: 0.5), dur: d).midiCps;
			var env = Sine.kr(trig: 1, dur: d.maxItem) * Rand.ir(lo: 0.005, hi: 0.01);
			var pos = XLn.kr(start: Rand.ir(lo: -1, hi: 1), end: Rand.ir(lo: -1, hi: 1), dur: d);
			var osc = SinOsc.ar(freq: freq, phase: 0);
			Pan2.ar(in: osc, pos: pos, level: env).sum
		};
		var scale = [0, 2, 4, 5, 7, 9, 11];
		var octaves = [4, 5, 6, 7];
		var mnn = all { :n + (o * 12), n <- scale, o <- octaves };
		var chd = { mnn.choose }.dup(6);
		{ chrd.value(chd) }.dup(9).sum
	},
	sustainTime: 21,
	transitionTime: 0,
	overlap: 3,
	numChannels: 2,
	maxRepeats: inf,
	postProcess: nil,
	bus: 0
)

//---- calculations
var scale = [0, 2, 4, 5, 7, 9, 11];
var octaves = [4, 5, 6, 7];
[
	all { :n + (o * 12), n <- scale, o <- octaves },
	[scale, octaves].allTuples.collect({ arg each; each.first + (each.second * 12) }),
	scale.collect({ arg n; octaves.collect({ arg o; n + (o * 12) }) }).flatten
]
