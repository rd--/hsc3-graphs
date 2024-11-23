/* Sequencer ; Jmcc */
let z = 0; let a = 0.1; let b = 0.2; let c = 0.4;
let p = Dseq(1, [
	Dseq(2, [c z z z z z z z]),
	Dseq(2, [c z z b z z b z c z z z b z b a]),
	Drand(inf, [
		Dseq(2, [c z z b z z b z c z b z c z b z]),
		Dseq(2, [c z a b z a b z c z b z c a b a]),
		Dseq(2, [c a a b z a b a c z b z c a b a]),
		Dseq(2, [c a a b z a b a c z b z z b a a]),
		Dseq(2, [c z z z z z z z]),
		Dseq(2, [c z z b z z b z c z z z b z b a])
	])
]);
let q = Drand(inf, [
	Dseq(2, [c z b z a a a a b z b z z z b z]),
	Dseq(2, [c z z z z z z z b z b z z z c z]),
	Dseq(2, [c z z z a z z z b z b z a z c z])
]);
let clock = Impulse(9, 0);
/* bass drum */
let trig1 = PulseDivider(clock, 16, 0);
let r = SinOsc(80, 0) * Decay2(trig1, 0.005, 0.5) * 0.3;
/* drum */
let trig2 = DemandImpulseSequencer([p], clock);
let exc2 = WhiteNoise() * Decay2(trig2, 0.005, 0.05);
let x = RingzBank(exc2, { Rand(80, 800) } ! 4, nil, { Rand(0.05, 0.2) } ! 4).Distort * 0.2;
/* metallic */
let trig3 = DemandImpulseSequencer([q], clock);
let exc3 = WhiteNoise() * Decay2(trig3, 0.005, 0.05);
let s = RingzBank(exc3, { Rand(3500, 4000) } ! 4, nil, { Rand(0.05, 0.2) } ! 4).Distort * 0.1;
/* whine */
let exc4 = GrayNoise(0.0007 # 2, 0);
let y = { :tr |
	let env = SinOsc(TRand(1, 6, tr), { TRand(0, 2.pi, tr) } ! 2) * 0.5 + 0.5;
	DynRingzBank(
		exc4,
		{ TiRand(200, 2500, tr) } ! 4,
		[1],
		{ TRand(0.2, 0.8, tr) } ! 4
	) * env
}.OverlapTexture(4, 2, 2).Mix.ScaleNeg(MouseX(-1, 1, 0, 0.2));
let snd = x + (y * 0.5) + s + r;
6.timesRepeat {
	snd := AllpassN(Lpz2(snd), 0.03, { Rand(0, 0.03) } ! 2, 5)
};
snd
