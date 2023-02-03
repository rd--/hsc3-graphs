;; Sequencer ; jmcc
var z = 0, a = 0.1, b = 0.2, c = 0.4;
var p = Lseq(1, [
	Lseq(2, [c, z, z, z, z, z, z, z]),
	Lseq(2, [c, z, z, b, z, z, b, z, c, z, z, z, b, z, b, a]),
	Lrand(inf, [
		Lseq(2, [c, z, z, b, z, z, b, z, c, z, b, z, c, z, b, z]),
		Lseq(2, [c, z, a, b, z, a, b, z, c, z, b, z, c, a, b, a]),
		Lseq(2, [c, a, a, b, z, a, b, a, c, z, b, z, c, a, b, a]),
		Lseq(2, [c, a, a, b, z, a, b, a, c, z, b, z, z, b, a, a]),
		Lseq(2, [c, z, z, z, z, z, z, z]),
		Lseq(2, [c, z, z, b, z, z, b, z, c, z, z, z, b, z, b, a])
	])
]);
var q = Lrand(inf, [
	Lseq(2, [c, z, b, z, a, a, a, a, b, z, b, z, z, z, b, z]),
	Lseq(2, [c, z, z, z, z, z, z, z, b, z, b, z, z, z, c, z]),
	Lseq(2, [c, z, z, z, a, z, z, z, b, z, b, z, a, z, c, z])
]);
var clock = Impulse(9, 0);
;; (* bass drum *)
var trig1 = PulseDivider(clock, 16, 0);
var r = SinOsc(80, 0) * Decay2(trig1, 0.005, 0.5) * 0.3;
;; (* drum *)
var trig2 = ImpulseSequencer([p], clock);
var exc2 = WhiteNoise() * Decay2(trig2, 0.005, 0.05);
var x = RingzBank(exc2, { Rand(80, 800) } ! 4, nil, { Rand(0.05, 0.2) } ! 4).Distort * 0.2;
;; (* metallic *)
var trig3 = ImpulseSequencer([q], clock);
var exc3 = WhiteNoise() * Decay2(trig3, 0.005, 0.05);
var s = RingzBank(exc3, { Rand(3500, 4000) } ! 4, nil, { Rand(0.05, 0.2) } ! 4).Distort * 0.1;
;; (* whine *)
var exc4 = { GrayNoise() } ! 2 * 0.0007;
var y = OverlapTexture({ :tr |
	var env = SinOsc(TRand(1, 6, tr), { TRand(0, 2 * pi, tr) } ! 2) * 0.5 + 0.5;
	DynRingzBank(exc4, { TiRand(200, 2500, tr) } ! 4, nil, { TRand(0.2, 0.8, tr) } ! 4) * env
}, 4, 2, 2).scaleNeg(MouseX(-1, 1, 0, 0.2));
var snd = x + (y * 0.5) + s + r;
6.timesRepeat {
	snd := AllpassN(Lpz2(snd), 0.03, { Rand(0, 0.03) } ! 2, 5)
};
snd
