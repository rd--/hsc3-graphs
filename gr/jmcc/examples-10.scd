
// Mixed textures

//////////////////////////////////////////////////////////////////////

(
// mix of three other examples...
var n1, p1, n2, p2, n3;
n1 = 5;	// number of sweepers
p1 = 10;	// number of partials per sweeper
n2 = 4;	// number of ring mod klanks
p2 = 8;	// number of partials per ring mod klank
n3 = 4;	// number of pulsing bottles
play({
	Mix.ar([
		OverlapTexture.ar({
			var sweep, spec;
			sweep = Resonz.ar(
				WhiteNoise.ar(0.003.rand),
				FSinOsc.kr(0.1 + 0.2.rand, 12 + 12.rand2, 60 + 24.rand2).midicps,
				0.1);
			spec = Array.fill(2, {
				`[
					Array.fill(p1, { 80 + 10000.0.linrand} ),
					nil,
					Array.fill(p1, { 0.5 + 2.0.rand } )
				]
			});
			Klank.ar(spec, sweep)
		}, 4, 4, n1, 2)
		,
		OverlapTexture.ar({
			a = Klank.ar(`[Array.rand(p2, 100, 10000), nil, Array.rand(p2, 0.2, 1.0)],
				Dust.ar(10, 0.02.rand));
			Pan2.ar(SinOsc.ar(LFNoise2.kr(1.0 + 0.3.rand2, 200, 350 + 50.rand), 0, a), 1.0.rand2);
		}, 4, 4, n2, 2)
		,
		OverlapTexture.ar({
			Pan2.ar(
				Resonz.ar(
					ClipNoise.ar(
						LFPulse.kr(4 + 15.0.linrand, 0.7.rand, 5/n3)
					),
					80 + 900.0.linrand,
					0.01
				),
				SinOsc.kr(0.1 + 0.4.rand, 2pi.rand)
			)
		}, 10, 1, n3, 2)
	]);
}))

//////////////////////////////////////////////////////////////////////

(
// pentatonic pipes and bells
var n, dur, env, env2, mode;
n = 5;	// number of overlapped events
dur = 8;
env = Env.linen(0.2, dur - 2, 1, 20, 'sine');
env2 = Env.new(#[1,1,0],[dur, 0.01]);
mode = [0, 3, 5, 7, 10];
Synth.scope({ arg synth;
	var a, b, c, d, mix1, mix2;

	#a, b, c, d = Spawn.ar({
		var root, chans;
		root = 36 + 12.rand;
		chans =
			Mix.arFill(n, {
				var amp, f;

				f = (20.rand.degreeToKey(mode, 12) + root).midicps;
				amp = EnvGen.kr(env);
				Pan2.ar(
					Resonz.ar(
						BrownNoise.ar(amp),
						f,
						0.002,
						4
					).distort * 0.04,
					1.0.rand2
				);
			})
			++
			Mix.arFill(4, {
				var amp, f;
				f = (10.rand.degreeToKey(mode, 12) + root + 36).midicps;
				Pan2.ar(
					Decay2.ar(
						Impulse.ar(2.0.rand),
						0.01, 2,
						FSinOsc.ar(f) + FSinOsc.ar(f+2.0.rand2)
					),
					1.0.rand2,
					0.05
				)
			});
		chans * EnvGen.kr(env2);
	}, 4, dur);

	mix1 = [a, b];
	mix2 = [c, d];

	mix1 = CombN.ar(mix1, 0.3, 0.3, 8, 1, mix1.reverse)
		+ CombN.ar(mix1, 0.3, 0.2.rand + 0.1, 8)
		+ CombN.ar(mix1, 0.3, 0.2.rand + 0.1, 8);

	6.do({ mix2 = AllpassN.ar(mix2, 0.05, [0.05.rand,0.05.rand], 8) });

	mix1 + mix2
}, 0.2);
)

//////////////////////////////////////////////////////////////////////

(
// tarmac
Synth.scope({
	var z;
	z = OverlapTexture.ar({ arg spawn, i, synth;
		var t, d;
		t = Impulse.kr(8);
		d = rrand(0.05, 0.5);
		Pan2.ar(
	            RLPF.ar(
		            	Klank.ar(
		                `[
		                    Array.linrand(4, 50.0, 2000.0),
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
		            	`(
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
	}, 12, 3, 6, 2)
	+
	OverlapTexture.ar({
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
	}, 8, 3, 4, 2);

	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
}, 0.25);
)

//////////////////////////////////////////////////////////////////////

(
// dancing shadows
var n, pat;
n = 20;
// create an algorhythmic rhythm pattern
pat = Prand.new([ // choose one of the following patterns at random
		Pseq.new(#[2.0, 0.0, 2.0, 0.0, 1.0, 0.0, 1.0, 1.0], 2),
		Pseq.new(#[2.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0], 2),
		Pseq.new(#[2.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0], 2),
		Pseq.new(#[2.0, 0.3, 0.3, 1.0, 0.3, 0.3, 1.0, 0.3], 2),
		Pseq.new(#[2.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0], 2),
		Pseq.new(#[2.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0], 1),
		Pseq.new(#[2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], 1),
		Pseq.new(#[0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0], 2),

		Pseq.new(#[1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0], 2),
		Pseq.new(#[1.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0], 2),
		Pseq.new(#[1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0], 2),

		Pseq.new(#[1.0, 1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0], 2),
		Pseq.new(#[0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0], 2),

		Pseq.new(#[0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 1.0], 2),
		Pseq.new(#[2.0, 0.0, 1.0, 1.0, 0.0, 1.0, 0.0, 0.0], 2),

		Pseq.new(#[0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0], 2),
		Pseq.new(#[2.0, 1.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0], 2),

		Pseq.new(#[1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0,
				0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0])
	], inf
);
{
	OverlapTexture.ar({
		var rate, trig, notes, melodyDeg, melodyFreq;
		rate = 5 + 0.5.rand;
		trig = Impulse.kr(rate);
		notes = Array.rand(5, 0.0, 12.0).sort;
		melodyDeg = 8.rand;
		melodyFreq = (melodyDeg.degreeToKey(notes) + 84).midicps;
		Mix.arFill(n, { arg i;
			var freq, pulse, env;
			freq = (38.rand.degreeToKey(notes) + 30).midicps;
			pulse = ImpulseSequencer.kr( pat.asStream, trig, (40.sqrt * 6)/(n * freq.sqrt));
			env = Decay2.kr(pulse,  0.005, 6 / rate);
			Pan2.ar(
				SinOsc.ar(
					freq,
					0,
					LFNoise1.kr(0.5.rand, env)
				),
				1.0.rand2
			)
		})
		+
		Resonz.ar(WhiteNoise.ar, Lag.kr(Sequencer.kr({
			if (0.3.coin, {
				melodyDeg = (melodyDeg + 2.rand2).fold(0,7);
				melodyFreq = (melodyDeg.degreeToKey(notes) + 84).midicps;
			});
			melodyFreq
		}, trig), 0.05), 0.01, 1.5)
	}, 45, 2, 0.95, 2);
}.scope(0.2);
)

//////////////////////////////////////////////////////////////////////

(
// choip choip choip
	var t = 12;
	~overlap_texture.({
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
	z
})
)


//////////////////////////////////////////////////////////////////////
