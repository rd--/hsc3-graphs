"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

/*
These examples are all surrounded by parentheses. You can double click to the right
of the first open paren to select the entire example. Then press the 'enter' key to
execute it. To stop execution, press cmd-period (i.e. the Apple key and the '.' key).

Some examples may be too CPU intensive for slower computers. In some examples there
are parameter variables you can change to alter the number of voices in the patch to
fit your machine's speed.

There are no samples or sound files in this example file, this is all synthesized.
*/


//////////////////////////////////////////////////////////////////////////

(
// interaural time delay panning   ("Griot modeling" variant)
// To hear this you'll need to wear headphones.

// This patch demonstrates using ONLY interaural time delay as the panning mechanism.
// mouse x controls interaural delay, mouse y controls excitation

// I find it very interesting that the amplitude is equal in both channels even though you
// perceive it as coming entirely from one side when it is panned to that side.

play({

	var n, buffers, tapTimes, excitation, delayedSignals, filteredDelays, output, dummy,
	melody, melodyFunc, env;

	n = 5; // number of delay lines

	melodyFunc = {
		// this function creates a list of channel numbers.
		// each channel is a different string.
		var chan = 2;
		melody = [];
		12.do({
			if ( 0.4.coin, {
				chan = (chan + 1.xrand2).wrap(0, n-1);
			});
			melody = melody.add(chan);
		});
	};
	melodyFunc.value;

	// allocate buffers for the delay lines
	buffers = Array.fill(n, { Signal.new(Synth.sampleRate * 0.01); });

	// assign tap times which determine the string pitches
	tapTimes = Array.series(n, 0.003, 0.0005);

	// excitation
	env = Env.new([0,1,0], [0.01, 0.2], -2);
	excitation = Spawn.ar({ arg spawn, i, synth;
		if ((i % 144) == 0, { melodyFunc.value }); // new melody every 144 notes
		synth.channelOffset = melody @@ i;
		LFNoise2.ar(MouseY.kr(10, 10000), EnvGen.kr(env, 1, 0, 0.1.rand));
	}, n, 0.1);

	// tap the delay lines
	delayedSignals = TapN.ar(buffers, tapTimes);

	// filter the taps
	filteredDelays = LPF.ar(delayedSignals, 2000, 0.98);

	// write to delay lines
	DelayWr.ar(buffers, filteredDelays + excitation);	// write the mixed signal to the delay line

	output = Mix.ar(filteredDelays);	// mix 5 channels to one

	// panning using only inter-aural arrival time cue
	// Mouse x controls the delay to each ear

	[DelayL.ar(output, 0.002, MouseX.kr(0,0.002)), DelayL.ar(output, 0.002, MouseX.kr(0.002,0)) ]
})
)

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
	~xfade_texture.({
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
	~xfade_texture.({
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

(
// a variant of "analog daze" that changes the pattern occasionally

{ arg synth;
	var seqref, f, x, g;

	seqref = Ref.new(0);		// this will be filled with an array by the Synth task

	// this Synth task changes the figuration pattern every 8 seconds
	synth.repeat(0, 8, {
		var basenote, pitchset, figuration;
		basenote = 42 + 12.rand;
		pitchset = Array.fill(5, { basenote + 12.rand });
		figuration = Array.fill(8, { pitchset.choose });
		seqref.value = figuration;
	});

	// function to create an analog synth voice
	f = { arg octave, clockRate, pwmrate, fltrate;
		RLPF.ar( LFPulse.ar( Lag.kr(
					(Sequencer.kr(
						seqref, // sequencer pattern
						Impulse.kr(clockRate)	// sequencer trigger
					) + (12 * octave)).midicps, // add octave offset
					0.05	// Lag time coefficient
				),
				SinOsc.kr(pwmrate, 2pi.rand, 0.4, 0.5),  // pulse width modulator
				0.1 	// pulse amplitude
			),
			SinOsc.kr(fltrate, 2pi.rand, 1700, 2000), // cutoff freq LFO
			1/15 )
		};

	// snare drum sound
	x = Decay.ar(Impulse.ar(2), 0.15, LFNoise0.ar(LFNoise1.kr(0.3,6000,8000),[0.07,0.07]));

	// create two synth voices on separate channels and add snare.
	g = [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)] + x;

	// add echo to reversed stereo image.
	0.4 * CombN.ar(g, 0.375, 0.375, 4, 1, g.reverse);
}.play
)

//////////////////////////////////////////////////////////////////////////

(
// Berlin 1977 + bass
// mouse x controls clock rate
// mouse y controls wet/dry
{
	var patternList, clockRate, clockTime, clock, clock16, clock16b;
	var note, freq, freq2, amp, amp16, filt, sig;
	var transpose, note2;

	clockRate = MouseX.kr(5, 20);
	clockTime = clockRate.reciprocal;
	clock = Impulse.kr(clockRate); // sequencer trigger
	clock16 = PulseDivider.kr(clock, 16, 0);	// divide clock by 16
	clock16b = PulseDivider.kr(clock, 16, -1);	// divide clock by 16
	patternList = #[55,60,63,62,60,67,63,58];
	note = Sequencer.kr( `patternList, clock ); // midi note pattern sequencer
		// every 16 beats transpose somewhat randomly
	transpose = Sequencer.kr(
			{ #[-12,-7,-5,0,2,5].choose }, 	// function called at each trigger
			clock16
		);
	note2 = Sequencer.kr(
			{ #[48, 43, 36].choose + transpose.poll }, 	// function called at each trigger
			clock16b
		);
	freq = (note + transpose).midicps;		// convert midi note to cycles per second
	freq2 = (note2).midicps;
		// amplitude envelope
	amp = Decay2.kr(clock, 0.05 * clockTime, 2 * clockTime, 0.1, 0.02);
	amp16 = Decay2.kr(clock16b, 16 * 0.05 * clockTime, 16 * 2 * clockTime, 0.08, 0.02);
		// filter envelope scaled by LFO
	filt = Decay2.kr(clock, 0.05 * clockTime, 2 * clockTime, SinOsc.kr(0.17, 0, 800), 1400);

	sig = RLPF.ar(
			LFPulse.ar(	// for better quality replace 'LFPulse' with 'Pulse'
				freq,
				SinOsc.kr(0.08, [0, 0.5pi], 0.45, 0.5), // pulse width LFO(s)
				amp
			),
			filt,
			0.15		// 1/Q
		)
		+
		RLPF.ar(
			LFPulse.ar(	// for better quality replace 'LFPulse' with 'Pulse'
				freq2,
				SinOsc.kr(0.12, [0, 0.5pi], 0.48, 0.5), // pulse width LFO(s)
				amp16
			),
			freq2 * SinOsc.kr(0.21, 0, 4, 8),
			0.07		// 1/Q
		);

	CombN.ar(sig * MouseY.kr(0,1),
		0.2, [0.2, 0.17], 2,		// max delay, actual delay(s), decay time
		1, sig
	)
}.play
// mouse x controls clock rate
// mouse y controls wet/dry
)

//////////////////////////////////////////////////////////////////////////

(
// yet another "Griot modeling" variant, much more taxing on CPU: requires a G3
// this one is a two instrument duet, one playing in half time a half length pattern.
// In addition each string pitch is modeled twice, once for each channel, to give a richer sound.
// mouse x controls damping, mouse y controls excitation
{
Mix.ar(Array.fill(2, { arg j;
	var n, buffers, tapTimes, excitation, delayedSignals, filteredDelays, output, dummy,
	melody, melodyFunc, env;

	n = 10; // number of delay lines

	melodyFunc = {
		// this function creates a list of channel numbers.
		// each channel is a different string.
		var chan = 2;
		melody = [];
		12.do({
			if ( 0.6.coin, {
				chan = (chan + 1.xrand2).wrap(0, n-1);
			});
			melody = melody.add(chan);
		});
	};
	melodyFunc.value;

	// allocate buffers for the delay lines
	buffers = Array.fill(n*2, { Signal.new(Synth.sampleRate * 0.01); });
	//buffers.postln;

	// assign tap times which determine the string pitches
	tapTimes = Array.series(n, 0.0015, 0.0005).stutter(2);
	//tapTimes.postln;

	// excitation
	env = Env.new([0,1,0], [0.01, 0.2], -2);
	excitation = Spawn.ar({ arg spawn, i, synth;
		if ((i % (144 / (j+1))) == 0, { melodyFunc.value }); // new melody every 144 notes
		synth.channelOffset = ((melody @@ i) * 2);
		LFNoise2.ar(MouseY.kr(10, 10000), EnvGen.kr(env, 1, 0, 0.1.rand), [0,0]);
	}, n*2, 0.1 * (j+1));

	// tap the delay lines
	delayedSignals = TapN.ar(buffers, tapTimes);

	// filter the taps
	filteredDelays = LPF.ar(delayedSignals, MouseX.kr(10, 10000), 0.98);

	// write to delay lines
	DelayWr.ar(buffers, filteredDelays + excitation);	// write the mixed signal to the delay line

	// group strings into stereo pairs
	filteredDelays = filteredDelays.clump(2);

	Mix.ar(filteredDelays);	// mix 5 channel pairs to one
}))

	// uncomment ( via cmd-shift-/ )for a cheap sounding shaker..
//	+
//	Resonz.ar(
//		HPZ2.ar(Dust2.ar( Lag.kr( LFPulse.kr(0.4.reciprocal, 0.12, 10000), 0.1), 2 )),
//		SinOsc.kr(2, 0, 400, 4000), 0.2
//	);

}.play
// mouse x controls damping, mouse y controls excitation
)

//////////////////////////////////////////////////////////////////////////

(
// tapping tools
// mouse x controls impulse rate
var e;
e = Env.linen(1, 4, 1);
play({
	var sound, rate;
	rate = XLine.kr(64, 0.125, 60);
	sound = Spawn.ar({
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
						0.03
					),
					0.001		// decay time - very short
				)
			),
			1.0.rand2, // place each object at a random position in the stereo field
			EnvGen.kr(e)
		)
	}, 2, 1);
	3.do({ sound = AllpassN.ar(sound, 0.05, [0.05.rand,0.05.rand], 2); });
	sound
})
)

//////////////////////////////////////////////////////////////////////////
