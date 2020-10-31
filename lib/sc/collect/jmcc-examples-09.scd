//////////////////////////////////////////////////////////////////////

(
// deep trip
	Texture.overlap( {
		f = LFNoise1.kr(0.3.rand, 60, 70).midicps;
		z = SinOsc.ar(f, 0,
			LFNoise2.ar(
				f * 0.5.rand,
				LFNoise1.kr(8.0.rand, SinOsc.kr(40.0.rand,0,0.1)).max(0)
			)
		);
		s = Pan2.ar(z, LFNoise1.kr(5.0.rand));
		s + CombN.ar(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20)
		+ CombN.ar(s, 0.5, [0.2.rand + 0.3, 0.2.rand + 0.3], 20);
	}, 12, 4, 4, 2);
)

//////////////////////////////////////////////////////////////////////

// SEE MRIDIGAM

//////////////////////////////////////////////////////////////////////

(
// sawed cymbals
var p;
p = 15;	// number of partials per channel per 'cymbal'.
	Texture.overlap({
		var z, f1, f2;
		f1 = 500 + 2000.0.rand;
		f2 = 8000.0.rand;
		z = Array.fill(2, {
			`[	// sine oscil bank specification :
				y = Array.fill(p, { f1 + f2.rand} ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(p, { 2.0 + 4.0.rand })	// ring times
			]
		});
		Klank.ar(z, LFSaw.ar(XLine.kr(600.0.rand, 600.0.rand, 12), 0, 0.0005));
	}, 4, 4, 6, 2)
)

//////////////////////////////////////////////////////////////////////

(
// sidereal time
var p;
p = 15;	// number of partials per channel per 'cymbal'.
	Texture.overlap({
		var z, f1, f2, f3, in, out;
		f1 = 100;
		f2 = 6000.0;
		z = Array.fill(2, {
			`[	// sine oscil bank specification :
				y = Array.fill(p, { exprand(f1, f2) } ), // frequencies
				nil, 							// amplitudes default to 1.0
				Array.fill(p, { 2.0 + 4.0.rand })	// ring times
			]
		});
		f3 = XLine.kr(exprand(40.0, 300.0), exprand(40.0, 300.0), 12);
		in = LFPulse.ar(f3, rrand(0.1, 0.9), 0, 0.002 * LFNoise2.kr(8.0.rand).max(0));
		out = Klank.ar(z, in).distort * 0.1;
		CombN.ar(out, 0.6, 0.5.rand + 0.1, 8, 1, out.reverse);
	}, 4, 4, 6, 2)
)

//////////////////////////////////////////////////////////////////////

(
// pentatonic pipes
// Mouse X on right half of screen causes pulsation
var n, env, set, mode, root;
n = 5;	// number of overlapped events
env = Env.linen(0.2, 8, 1, 20, 'sine');
mode = [0, 3, 5, 7, 10];
root = 36 + 12.rand;
Texture.overlap({arg i;
		var amp, f;
        if(i%20 == 0, {root = 36 + 12.rand; root.postln});
		f = (20.rand.degreeToKey(mode, 12) + root).midicps;
		amp = EnvGen.kr(env);
		Pan2.ar(
			Resonz.ar(
				PinkNoise.ar(amp),
				f,
				0.002,
				4
			).distort * 0.2,
			1.0.rand2
		);
	}, 10, 0.01, n, 2, postProcess: {arg z;
	z = z * LinXFade2.kr(1.0, SinOsc.kr(5).max(0), MouseX.kr > 0.5); // pulsation
	CombN.ar(z, 0.3, 0.3, 8, 1, z.reverse);
    })
)

//////////////////////////////////////////////////////////////////////

(
// ostinoodles
    var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
var major, root;
root = 81 + 6.rand2;
major = #[0, 2, 4, 5, 7, 9, 11];
	Texture.overlap({
		var f, offset, sequence, trig;
		offset = 16.rand2;
		sequence = ((#[0, 1, 2, 3] + offset).scramble.degreeToKey(major) + root).midicps;
		trig = Impulse.kr(XLine.kr(exprand(4.0, 24.0), exprand(4.0, 24.0), 12));
		f = sequ.(sequence, trig);
		Pan2.ar(
			LFTri.ar(f, 0, Decay2.kr(trig, 0.004, 0.3, 0.1)),
			1.0.rand2
		);
	}, 6, 3, 6, 2, postProcess: {arg z;
	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
});
)

//////////////////////////////////////////////////////////////////////

(
// bowed garage door springs
	Texture.overlap({
		Pan2.ar(
	            Klank.ar(
	                `[
	                    Array.rand(4, 50.0, 2000.0),
	                    nil,
	                    Array.rand(4, 0.2, 12.0)
	                ],
	                PinkNoise.ar(LFNoise1.kr(3.0.rand, 0.0008, 0.0022))
	            ).abs * #[-1, 1].choose,
	            LFNoise1.kr(1.0.rand)
	      )
	}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
}
))

//////////////////////////////////////////////////////////////////////

(
// contamination zone
Texture.overlap({
		var f;
		f = exprand(800, 8000);
		Pan2.ar(
	            RLPF.ar(
		            Klank.ar(
		                `[
		                    Array.rand(4, 50.0, 2000.0),
		                    nil,
		                    Array.rand(4, 0.2, 4.0)
		                ],
		                PinkNoise.ar(LFNoise1.kr(3.0.rand, 0.0008, 0.0022))
		            ).abs * #[-1, 1].choose,
		            SinOsc.kr(1.0.linrand, 0, 0.7 * f, f),
		            0.1
		       ),
	            LFNoise1.kr(1.0.rand),
	            LFPulse.kr(15.0.linrand, 0, 0.2 + 0.2.rand)
	      )
	}, 8, 3, 4, 2, postProcess: {arg z;
	6.do({
		z = AllpassN.ar(z, 0.040, [0.040.rand,0.040.rand], 16)
	});
	z
});
)

//////////////////////////////////////////////////////////////////////

(
// array manipulation of multi channel audio
	Texture.xfade({
		var a, b, c, d, e;
		// 2 channels each of 3 different processes:
		a = Array.fill(2, {
				FSinOsc.ar(2000.0.rand,0,
					Decay2.kr(Impulse.kr(8.0.rand),
						0.01, 0.3, 0.1))
			});
		b = Array.fill(2, {
				Resonz.ar(GrayNoise.ar(
					LFNoise2.kr(4.0.rand, 2).max(0)),
					2000.0.rand, 0.05)
			});
		c = Array.fill(2, {
				Klank.ar(
					`[
						Array.rand(8, 80.0, 3000.0),
						nil,
						Array.rand(8, 0.2, 2.0)
					],
					Dust.ar(2, 0.1)
				)
			});
		a = a ++ b ++ c;	   // concatenate all channels
		a = a.scramble;		// scramble channels
		d = a.copyRange(0, 2);	// copy first half, assign to d
		e = a.copyRange(3, 5);	// copy second half, assign to e
		// echo elements of d
		d = CombN.ar(d, 0.3, Array.rand(3, 0.1, 0.3), 4, 1, d);
		// absolute value distortion on elements of e
		e = e.abs;
		f = (d ++ e).scramble;	// concatenate, scramble
		f = f.clump(2);			// make into groups of 2 channels
		Mix.ar(f);				// mix stereo pairs to one pair
	}, 9, 1, 2);
)

//////////////////////////////////////////////////////////////////////