// Choip choip choip ; Jmcc ; graph re-write (Rd)
var t = 12;
var z = OverlapTexture({ |tr|
	var impulses = Impulse.ar(
		TxLine.kr(TExpRand.kr(1,30,tr), TExpRand.kr(1,30,tr), t, tr)
	);
	var f = TxLine.kr(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), t, tr);
	Pan2.ar(
		Decay2.ar(
			impulses * TxLine.kr(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), t, tr),
			0.01,
			0.2,
			SinOsc.ar(Decay2.ar(impulses, 0.05, 0.5, -0.9*f, f))
		),
		TLine.kr(TRand.kr(-1,1,tr), TRand.kr(-1,1,tr), t, tr)
	);
}, t - 2, 1, 8, 2);
4.do { z = AllpassN.ar(z, 0.1, [Rand.ir(0,0.05),Rand.ir(0,0.05)], 4) };
z

// ---- Tarmac ; Jmcc
Texture.overlapRoutine ({arg i;
	var t = Impulse.kr(8);
	var d = rrand(0.05, 0.5);
	Pan2.ar(
		RLPF.ar(
			Klank.ar(
				`[
					Array.linrand(4, 50.0, 4000.0),
					nil,
					Array.rand(4, 0.2, 12.0)
				],
				PinkNoise.ar(LFNoise1.kr(3.0.rand, 0.0008, 0.0022))
			).max(0) * #[-1, 1].choose,
			Decay2.kr(t, 0.004, d, 5000.0.rand, 100.0.rand + 100),
			0.2
		),
		LFNoise1.kr(1.0.rand),
		Decay2.kr(
			ImpulseSequencer.kr(
				(
					#[
						[1, 0, 0],
						[1, 1, 0],
						[1, 1, 0, 0],
						[1, 1, 1, 0, 0, 0],
						[1, 1, 1, 0, 0, 0, 0, 0],
						[1, 1, 1, 1, 0, 0, 0, 0],
						[1, 1, 1, 1, 1, 0, 0, 0],
						[1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
					].choose.scramble),
				t), 0.004, d)
	)
}, 12, 3, 6, 2);

// Tarmac ; Jmcc ; edit (rd)
Texture.overlapRoutine({
	Pan2.ar(
		Klank.ar(
			`[
				Array.linrand(4, 700.0, 6000.0),
				nil,
				Array.linrand(4, 0.2, 12.0)
			],
			PinkNoise.ar(0.0008)
		),
		LFNoise1.kr(1.0.rand),
		LFNoise1.kr(LFNoise1.kr(1,3,4), 0.4, 0.6)
	)
}, 8, 3, 4, 2, postProcess: { arg z;
	6.do {
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	};
	z
})

// Choip choip choip ; Jmcc
var t = 12;
Texture.overlapRoutine({
	var impulses = Impulse.ar(
		XLine.kr(exprand(1,30), exprand(1,30), t)
	);
	var f = XLine.kr(exprand(600.0, 8000.0), exprand(600.0, 8000.0), t);
	Pan2.ar(
		Decay2.ar(
			impulses * XLine.kr(exprand(0.01, 0.5), exprand(0.01, 0.5), t),
			0.01,
			0.2,
			SinOsc.ar(Decay2.ar(impulses, 0.05, 0.5, -0.9*f, f))
		),
		Line.kr(1.0.rand2, 1.0.rand2, t)
	)
}, t-2, 1, 8, 2, postProcess: { arg z;
	4.do({ z = AllpassN.ar(z, 0.1, [0.05.rand,0.05.rand], 4) });
	z})

// ---- ; untranslated ; mix of three other examples... ; pentatonic pipes and bells ; dancing shadows
