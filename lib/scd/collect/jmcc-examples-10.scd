	// choip choip choip ; graph re-write
	var t = 12;
	var z = RTexture.overlapGraph({
        arg tr;
        var tline = {arg lhs, rhs, dur, tr; LinLin.kr(in: Sweep.kr(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
        var txline = {arg lhs, rhs, dur, tr; LinExp.kr(in: Sweep.kr(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
		var impulses = Impulse.ar(
			txline.value(TExpRand.kr(1,30,tr), TExpRand.kr(1,30,tr), t, tr)
		);
		var f = txline.value(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), t, tr);
		Pan2.ar(
			Decay2.ar(
				impulses * txline.value(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), t, tr),
				0.01,
				0.2,
				SinOsc.ar(Decay2.ar(impulses, 0.05, 0.5, -0.9*f, f))
			),
			tline.value(TRand.kr(-1,1,tr), TRand.kr(-1,1,tr), t, tr)
		);
	}, t-2, 1, 8, 2);
	4.do({ z = AllpassN.ar(z, 0.1, [Rand.ir(0,0.05),Rand.ir(0,0.05)], 4) });
	z

//---- textures ; non-graph

// tarmac
RTexture.overlap({arg i;
        var imp_seq = {arg s, tr; Demand.kr(tr, 0, Dseq.dr(s,inf)) * tr};
		var t, d;
		t = Impulse.kr(8);
		d = rrand(0.05, 0.5);
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
	            	imp_seq.value(
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

RTexture.overlap({
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
	}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
});

	// choip choip choip
	var t = 12;
	RTexture.overlap({
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
	}, t-2, 1, 8, 2, postProcess: {arg z;
	4.do({ z = AllpassN.ar(z, 0.1, [0.05.rand,0.05.rand], 4) });
	z})


//---- ; untranslated

// UNTRANS - mix of three other examples...

// UNTRANS - pentatonic pipes and bells

// UNTRANS - dancing shadows
