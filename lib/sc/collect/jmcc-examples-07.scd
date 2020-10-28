//////////////////////////////////////////////////////////////////////////

// UNTRANS - interaural time delay panning   ("Griot modeling" variant)

//////////////////////////////////////////////////////////////////////////

(
// aleatoric quartet
// mouse x controls density
play({
	var amp, density, dmul, dadd, signal;
	amp = 0.07;
	density = MouseX.kr(0.01,1); // mouse determines density of excitation
	// calculate multiply and add for excitation probability
	dmul = density.reciprocal * 0.5 * amp;
	dadd = dmul.neg + amp;
	signal = Mix.ar(	// mix an array of 4 instruments
		Array.fill(4, {
			var excitation, freq;
			excitation = PinkNoise.ar(
				// if amplitude is below zero it is clipped
				// density determines the probability of being above zero
				max(0, LFNoise1.kr(8, dmul, dadd))
			);
			freq = Lag.kr(			// lag the pitch so it glissandos between pitches
				LFNoise0.kr(				// use low freq step noise as a pitch control
					[1, 0.5, 0.25].choose, 	// choose a frequency of pitch change
					7, 					// +/- 7 semitones
					66 + 30.rand2			// random center note
				).round(1), 		// round to nearest semitone
				0.2				// gliss time
			).midicps;			// convert to hertz
			Pan2.ar(	// pan each intrument
				CombL.ar(excitation, 0.02, freq.reciprocal, 3), // comb delay simulates string
				1.0.rand2		// random pan position
			);
	}));
	// add some reverb via allpass delays
	5.do({ signal = AllpassN.ar(signal, 0.05, [0.05.rand,0.05.rand], 1) });
	LeakDC.ar( signal, 0.995);		// delays build up a lot of DC, so leak it out here.
});
)

//////////////////////////////////////////////////////////////////////////

(
// ritual hymn in praise of the god of the LS-3000 life support unit.
// Klang - slow beating sines.
	var n, d;
	n = 20;	// n*3 components in each channel
	d = 5.0;	// beat freq deviation
	Texture.xfade({
		var z, p, q;
		p = Array.new(3*n);
		q = Array.new(3*n);
		n.do({ var freq;
			freq = (24 + 60.rand).midicps;
			p.add(freq);
			p.add(freq + d.rand2);
			p.add(freq + d.rand2);
		});
		n.do({ arg i;  var freq;
			freq = p.at(3*i);
			q.add(freq + d.rand2);
			q.add(freq + d.rand2);
			q.add(freq + d.rand2);
		});
		z = [`[p, nil, Array.rand(3*n, 0, 2pi)],
			`[q, nil, Array.rand(3*n, 0, 2pi)]
			];
		Klang.ar(z) * (0.1/n);
	}, 4, 4, 2)
)

//////////////////////////////////////////////////////////////////////////

(
// the church of chance
// Klang - slow beating harmonic sines.
	var n, d, m, x;
	n = 8;	// number of notes
	d = 0.4;	// beat freq deviation
	m = 5;	// harmonics per note
	Texture.xfade({
		var z, p, q, k;
		p = Array.new(m*n);
		q = Array.new(m*n);
		k = 24 + 12.rand;
		n.do({ var freq;
			freq = (#[0,2,4,5,7,9].choose + (7.rand*12) + k).midicps;
			p.add(freq + d.rand2);
			p.add(freq*2 + d.rand2);
			p.add(freq*4 + d.rand2);
			p.add(freq*5 + d.rand2);
			p.add(freq*6 + d.rand2);
		});
		n.do({ arg i;  var freq;
			freq = p.at(m*i);
			q.add(freq + d.rand2);
			q.add(freq*2 + d.rand2);
			q.add(freq*4 + d.rand2);
			q.add(freq*5 + d.rand2);
			q.add(freq*6 + d.rand2);
		});
		z = [`[p, nil, Array.rand(m*n, 0, 2pi)],
			`[q, nil, Array.rand(m*n, 0, 2pi)]
			];
		Klang.ar(z) * (0.1/n);
	}, 6, 3, 2);
)

//////////////////////////////////////////////////////////////////////////

// UNTRANS - a variant of "analog daze" that changes the pattern occasionally

//////////////////////////////////////////////////////////////////////////

// UNTRANS - Berlin 1977 + bass

//////////////////////////////////////////////////////////////////////////

// UNTRANS - yet another "Griot modeling" variant, much more taxing on CPU: requires a G3

//////////////////////////////////////////////////////////////////////////

(
// tapping tools
// mouse x controls impulse rate
var e = Env.linen(1, 4, 1);
	Texture.spawn({
	var rate = XLine.kr(64, 0.125, 60);
		Pan2.ar(
			// resonant filter bank simulates resonant modes of bouncing objects
			Klank.ar(
				`[
					Array.fill(4, { 400 + 8000.0.rand }), // resonant freqs
					nil,
					Array.fill(4, { 0.01 + 0.1.rand })  // ring times
				],
				// decays excite filter bank
				Decay.ar( // each impulse triggers a decay
					Impulse.ar(			// impulses trigger decay envelope
						(1 + 20.0.linrand) * rate,
                        0,
						0.03
					),
					0.001		// decay time - very short
				)
			),
			1.0.rand2, // place each object at a random position in the stereo field
			EnvGen.kr(e,doneAction:2)
		)
	}, 2, 1, postProcess: {arg z;3.do({z = AllpassN.ar(z, 0.05, [0.05.rand,0.05.rand], 2)});z})
)

//////////////////////////////////////////////////////////////////////////
