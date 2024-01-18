// jmcc ; blips ; 001
Texture.overlap({
	0.8.coin.ifTrue({
		Pan2.ar(
			Blip.ar(
				XLine.kr(0.25.exprand(400), 0.25.exprand(400), 4),
				XLine.kr(2.exprand(100), 2.exprand(100), 4)
			)
			* Blip.ar(
				XLine.kr(0.25.exprand(400), 0.25.exprand(400), 4),
				XLine.kr(2.exprand(100), 2.exprand(100), 4)
			),
			Line.kr(1.0.rand2, 1.0.rand2, 4),
			0.3
		)
	}, ifFalse: {
		Silent.ar(2)
	})
}, 2, 1, 12, 2, postProcess: {
	arg snd;
	var out = snd.distort;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 4) });
	out
})

// jmcc ; blips ; 002
Texture.overlap({
	0.8.coin.ifTrue({
		Pan2.ar(
			Blip.ar(
				0.25.exprand(400),
				XLine.kr(2.exprand(100), 2.exprand(100), 4)
			)
			* Blip.ar(
				0.25.exprand(400),
				XLine.kr(2.exprand(100), 2.exprand(100), 4)
			),
			Line.kr(1.0.rand2, 1.0.rand2, 4),
			0.3
		)
	}, ifFalse: {
		Silent.ar(2)
	})
}, 2, 1, 12, 2, postProcess: {
	arg snd;
	var out = snd.distort;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 4) });
	out
})

// jmcc ; blips ; 003
var dur = 16;
Texture.overlap({
	0.8.coin.ifTrue({
		Pan2.ar(
			Blip.ar(
				0.25.exprand(400),
				XLine.kr(2.exprand(100), 2.exprand(100), dur)
			)
			* Blip.ar(
				0.25.exprand(400),
				XLine.kr(2.exprand(100), 2.exprand(100), dur)
			),
			Line.kr(1.0.rand2, 1.0.rand2, dur),
			0.3
		)
	}, ifFalse: {
		Silent.ar(2)
	})
}, dur * 0.6, dur * 0.2, 12, 2, postProcess: {
	arg snd;
	var out = LPZ2.ar(snd).distort;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 3) });
	out
})

// jmcc ; blips ; 004
Texture.overlap({
	0.8.coin.ifTrue({
		Pan2.ar(
			CombN.ar(
				Blip.ar(
					0.25.exprand(400),
					XLine.kr(2.exprand(100), 2.exprand(100), 4)
				)
				* Blip.ar(
					0.25.exprand(400),
					XLine.kr(2.exprand(100), 2.exprand(100), 4)
				)
				* Blip.ar(
					0.25.exprand(400),
					XLine.kr(2.exprand(100), 2.exprand(100), 4)
				),
				0.4,
				0.4.rand,
				3.0.linrand
			),
			Line.kr(1.0.rand2, 1.0.rand2, 4),
			0.3
		)
	}, ifFalse: {
		Silent.ar(2)
	})
}, 2, 1, 12, 2, postProcess: {
	arg snd;
	var out = snd.distort;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 2) });
	out
})

// jmcc ; blips ; 005
var dur = 6;
Texture.overlap({
	0.8.coin.ifTrue({
		Pan2.ar(
			CombL.ar(
				Blip.ar(
					XLine.kr(0.25.exprand(400), 0.25.exprand(400), dur),
					XLine.kr(2.exprand(100), 2.exprand(100), dur)
				)
				* Blip.ar(
					XLine.kr(0.25.exprand(400), 0.25.exprand(400), dur),
					XLine.kr(2.exprand(100), 2.exprand(100), dur)
				)
				* Blip.ar(
					XLine.kr(0.25.exprand(400), 0.25.exprand(400), dur),
					XLine.kr(2.exprand(100), 2.exprand(100), dur)
				),
				0.5,
				XLine.kr(0.1.rrand(0.5), 0.1.rrand(0.5), dur),
				3.0.linrand
			),
			Line.kr(1.0.rand2, 1.0.rand2, dur),
			0.3
		)
	}, ifFalse: {
		Silent.ar(2)
	})
}, dur * 0.6, dur * 0.2, 12, 2, postProcess: {
	arg snd;
	var out = snd.distort;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 2) });
	out
})

// blips ; jmcc ; 029
var n = 8;
Texture.overlap({
	var out = { LFNoise0.ar(80) * 0.1 }.dup(2);
	6.do({
		out = LeakDC.ar(BRZ2.ar(CombL.ar(out, 0.1, [0.1.rand, 0.1.rand], 2)).distort, 0.995)
	});
	out * 0.3
}, 6, 2, 3, 2)

// blips ; jmcc ; 030
var n = 8;
Texture.overlap({
	var out = { LFNoise0.ar(80) * 0.1 }.dup(2);
	6.do({
		out = LeakDC.ar(
			BRZ2.ar(
				CombL.ar(
					out,
					0.1,
					[0.1.rand, 0.1.rand] * LFNoise1.ar(0.4.rrand(1.0), 0.1, 1),
					LFNoise1.ar(1.0.rrand(4.0), 1, 2)
				)
			).distort,
			0.995
		)
	});
	out * 0.2
}, 6, 2, 3, 2)

// blips ; jmcc ; 031
var n = 8;
Texture.overlap({
	var out = LFNoise0.ar(80) * 0.1;
	Mix.ar({
		Pan2.ar(
			BPF.ar(
				CombL.ar(out, 0.1, 24.rrand(66).midicps.reciprocal, 2, 8),
				8000.0.rand,
				0.4
			).distort,
			1.0.rand2,
			0.2
		)
	}.dup(4))
}, 6, 2, 3, 2)

// blips ; jmcc ; 031
var n = 8;
Texture.overlap({
	var out = LPZ2.ar(LFNoise0.ar(80) * 0.1);
	Mix.ar({
		Pan2.ar(
			LeakDC.ar(CombL.ar(out, 0.1, 24.rrand(66).midicps.reciprocal, -2, 8), 0.995).distort,
			1.0.rand2,
			0.1
		)
	}.dup(4));
}, 6, 2, 3, 2)

// blips ; jmcc ; 033 ; mouse x controls disturbulence.
var n = 8;
Texture.overlap({
	var r = (LFNoise0.kr(0.2.rrand(1)) + 1).squared * MouseX.kr(1, 4, 0, 0.2);
	var mix = (LFNoise2.ar([r, r]) * 80).fold2(0.2).cubed * 12;
	mix = Mix.ar({ CombL.ar(mix, 0.1, 0.03.linrand, 4.0.linrand) }.dup(3));
}, 9, 3, 4, 2, postProcess: {
	arg snd;
	var out = snd.distort * 0.2;
	6.do({ out = AllpassN.ar(out, 0.05, [0.05.rand, 0.05.rand], 3) });
	LeakDC.ar(out, 0.995)
})
