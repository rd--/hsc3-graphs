// https://twitter.com/lukiss163/status/1581607231463731200 ; lnu
var b = SfAcquire("floating_1", 1, [1]);
var n = [-36, -9, -14, 0, -19, -5, 3, -2, -24, -7];
var k = n.size;
var r = { LFDNoise3.ar(1 / 86).abs };
var w = Warp1.ar(1, b, r.dup(k), n.midiratio, 8 * r.dup(k) + 8 / 86, -1, 12, 1 / 4 * r.dup(k), 4) * r.dup(k);
Splay.ar(LeakDC.ar(FreeVerb.ar(w, r.dup(k), 0.5 + r.dup(k), r.dup(k)), 0.995), 1 / 2, 1, 0, true).tanh

// https://twitter.com/lukiss163/status/1581607231463731200 ; lnu ; keywords
var b = SfAcquire(
	urlOrKey: Platform.resourceDir +/+ "sounds/a11wlk01.wav",
	numberOfChannels: 1,
	channelIndices: [1]
);
var n = [-36, -9, -14, 0, -19, -5, 3, -2, -24, -7];
var k = n.size;
var r = { LFDNoise3.ar(freq: 1 / 86).abs };
var w = Warp1.ar(
	numChannels: 1,
	bufnum: b,
	pointer: r.dup(k),
	freqScale: n.midiratio,
	windowSize: 8 * r.dup(k) + 8 / 86,
	envbufnum: -1,
	overlaps: 12,
	windowRandRatio: 1 / 4 * r.dup(k),
	interp: 4) * r.dup(k);
Splay.ar(
	inArray: LeakDC.ar(in: FreeVerb.ar(in: w, mix: r.dup(k), room: 0.5 + r.dup(k), damp: r.dup(k)), coef: 0.995),
	spread: 1 / 2,
	level: 1,
	center: 0,
	levelComp: true
).tanh
