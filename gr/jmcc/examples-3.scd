"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

/*
These examples are all surrounded by parentheses. You can double click to the right
of the first open paren to select the entire example. Then press the 'enter' key to
execute it. To stop execution, press cmd-period (i.e. the Apple key and the '.' key).

Some examples may be too CPU intensive for slower computers. In some examples there
are parameter variables you can change to alter the number of voices in the patch to
fit your machine.

There are no samples or sound files in this example file, this is all synthesized.
*/

//////////////////////////////////////////////////////////////////////////

(
// analogue daze

var anaSynFunc, snare, e, g, z;
// define a function so that I can make a couple of copies of this instrument:
anaSynFunc = { arg octave, clockRate, pwmrate, fltrate;
	// create a list of frequencies
	var freqList = (
		#[55,63,60,63,57,65,62,65]			// specify in MIDI notes
		+ (12 * octave)					// offset by octaves argument
		).midicps;						// convert to cycles per second

    var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};

	// use a sequencer to step through the list of frequencies
	var freq = sequ.(
			freqList, 		// pass a reference to the list (see MultiChannel.help)
			Impulse.kr(clockRate)	// sequencer steps at each trigger from this oscillator
		);

 	// analog VCO->VCF voice:
	RLPF.ar(			// resonant lowpass filter
		LFPulse.ar(	// pulse wave oscillator input to filter
			Lag.kr(		// take the frequency and use a lag filter to make it glide
				freq, 	// from one pitch to another
				0.05		// Lag time
			),0,
			SinOsc.kr(			// pulse width modulator LFO
				pwmrate,		// LFO rate
				2pi.rand, 		// random initial phase
				0.4, 0.5),  	// scale and offset give pulse widths from 0.1 to 0.9
			0.1 			// pulse oscillator amplitude
		),
		SinOsc.kr(			// filter cutoff freq LFO
			fltrate, 			// LFO rate
			2pi.rand, 			// random initial phase
			1400, 2000), 		// scale and offset give cutoff freq from 600 to 3400 Hz
		1/15 // 1/Q
	)
}; // end of function definition f

play({
	// analogue snare drum
	snare = Decay.ar(		// an exponential decay envelope
		Impulse.ar(2), 		// impulses trigger envelope at 2 beats per second
		0.15, 			// 0.15 seconds to decay by 60 dB
		LFNoise0.ar(		// step noise used as snare sound
			LFNoise1.kr(0.3,6000,8000),	// sweep the noise frequency between 2000 and 14000 Hz
			[0.07, 0.07])		// amplitude (in stereo, causes whole snare subpatch to be stereo
							//               see MultiChannel.help)
		);

	// create two copies of sequencer patch in separate channels
	g = [								// call function f to create each instrument
		anaSynFunc.value(1, 8, 0.31, 0.2),  	// +1 octave,  8 clocks per second, PWM rate, RLPF rate
		anaSynFunc.value(0, 2, 0.13, 0.11)  	// +0 octaves, 2 clocks per second, PWM rate, RLPF rate
		]
		+ snare; // add to snares

	// comb delay of input plus dry stereo pair reversed
	z = 0.4 * (				// scale delayed part down
			CombN.ar(			// feedback delay
				g, 			// input dry signal
				0.375, 0.375, 	// 3/8 second delay
				5			// 5 second 60dB decay time
			)
		+ g.reverse );  		// add dry stereo pair with the channels reversed
	e = Env.linen(2, 56, 2); // one minute trapezoid envelope

	z * EnvGen.kr(e) 	// wrap a one minute envelope around entire sound
});
)

//////////////////////////////////////////////////////////////////////////

// The above program is heavily commented - almost one line per parameter.
// Just to show how concise your programs can be here is a more condensed version
// of the same patch.

(
var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
var pattern = #[55,63,60,63,57,65,62,65];
f = { arg octave, clockRate, pwmrate, fltrate;
	RLPF.ar( LFPulse.ar( Lag.kr(
				sequ.(
					((pattern + (12 * octave)).midicps), // sequencer pattern
					Impulse.kr(clockRate)	// sequencer trigger
				),
				0.05	// Lag time coefficient
			),0,
			SinOsc.kr(pwmrate, 2pi.rand, 0.4, 0.5),  // pulse width modulator
			0.1 // pulse amplitude
		),
		SinOsc.kr(fltrate, 2pi.rand, 1400, 2000), // cutoff freq LFO
		1/15 )
	};
play({
	x = Decay.ar(Impulse.ar(2), 0.15, LFNoise0.ar(LFNoise1.kr(0.3,6000,8000),[0.07,0.07]));
	g = [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)] + x;
	z = 0.4 * (CombN.ar(g, 0.375, 0.375, 5) + g.reverse);
	e = Env.linen(2, 56, 2); // one minute trapezoid envelope
	z * EnvGen.kr(e)
});
)


//////////////////////////////////////////////////////////////////////////

(
// native algorhythms
var n, pat, texture;
n = 8; 	// n = number of partials for percussion instruments

// create an algorhythmic rhythm pattern
pat = Prand([ // choose one of the following patterns at random
		Pseq(#[2.0, 0.0, 2.0, 0.0, 1.0, 0.0, 1.0, 1.0]),
		Pseq(#[2.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0]),
		Pseq(#[2.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0]),
		Pseq(#[2.0, 0.3, 0.3, 1.0, 0.3, 0.3, 1.0, 0.3]),
		Pseq(#[2.0, 0.0, 0.3, 0.0, 0.3, 0.0, 0.3, 0.0]),
		Pseq(#[2.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0]),
		Pseq(#[2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
		Pseq(#[0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0]),
		Pseq(#[1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0,
				0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0])
	], inf
);

play({
	OverlapTexture.ar({ // make an overlapping texture
		var freq, seq, excitation, resonator;

		freq = 40 + 300.0.rand; 		// random base frequency

		seq = ImpulseSequencer.ar(		// outputs a sequence of single sample triggers
				pat.asStream,	// create a stream to iterate over pattern
				Impulse.ar(10) 		// a clock for the sequencer at 10 beats per second
			);
		excitation = Decay.ar( 	// a decaying envelope for the noise
					seq, 			// impulse sequence triggers decay envelopes
					0.1, 			// 60 dB decay time
					PinkNoise.ar(0.01)	// noise is the exciter
			);
		resonator = Klank.ar( 		// use Klank as a percussion resonator
					`[	// filter bank specification array:
						Array.fill(n, { freq + (4.0*freq).linrand }), // resonant frequencies
						nil,							// amplitudes default to 1.0
						Array.fill(n, { 0.2 + 3.0.linrand }) 	// ring times
					],
					excitation
			);
		Pan2.ar(resonator, 1.0.rand2) // random pan position
		// return the Pan2
	}, 8, 4, 4, 2); // sustainTime, fadeTime, overlapDensity, number of channels
});
)

//////////////////////////////////////////////////////////////////////////

// this one is rather CPU intensive. Uses up to 76% of a PB 3400/180.
// On slower machines you can reduce the number of notes n.

(
// synthetic piano
var n;
n = 6;	// number of keys playing
play({
	Mix.ar(Array.fill(n, {	// mix an array of notes
		var delayTime, pitch, detune, strike, hammerEnv, hammer;

		// calculate delay based on a random note
		pitch = (36 + 54.rand);
		strike = Impulse.ar(0.1+0.4.rand, 0, 0.1); // random period for each key
		hammerEnv = Decay2.ar(strike, 0.008, 0.04); // excitation envelope
		Pan2.ar(
			// array of 3 strings per note
			Mix.ar(Array.fill(3, { arg i;
				// detune strings, calculate delay time :
				detune = #[-0.05, 0, 0.04].at(i);
				delayTime = 1 / (pitch + detune).midicps;
				// each string gets own exciter :
				hammer = LFNoise2.ar(3000, hammerEnv); // 3000 Hz was chosen by ear..
				CombL.ar(hammer,		// used as a string resonator
					delayTime, 		// max delay time
					delayTime,			// actual delay time
					6) 				// decay time of string
			})),
			(pitch - 36)/27 - 1 // pan position: lo notes left, hi notes right
		)
	}))
})
)

//------------------------------------------------------------------------

(
// this shows the piano excitation function used above
plot({
	var strike, env, noise;
	strike = Impulse.ar(0.01);
	env = Decay2.ar(strike, 0.008, 0.04);
	noise = LFNoise2.ar(3000, env * 2);
	[K2A.ar(env), noise]
}, 0.04);
)


//////////////////////////////////////////////////////////////////////////

(
// reverberated sine percussion
d = 10; // number of percolators
c = 7; // number of comb delays
a = 4; // number of allpass delays

play({
		// sine percolation sound :
	s = Mix.ar(Array.fill(d, { Resonz.ar(Dust.ar(2/d, 50), 200 + 3000.0.rand, 0.003)}) );

		// reverb predelay time :
	z = DelayN.ar(s, 0.048);

		// 7 length modulated comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(c,{0.1.rand}), 0.04, 0.05), 15));

		// chain of 4 allpass delays on each of two channels (8 total) :
	a.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });

		// add original sound to reverb and play it :
	s+(0.2*y)
}))

//////////////////////////////////////////////////////////////////////////

(
// reverberated noise bursts

play({
		// pink noise percussion sound :
	s = Decay.ar(Dust.ar(0.6, 0.2), 0.15, PinkNoise.ar);

		// reverb predelay time :
	z = DelayN.ar(s, 0.048);

		// 6 modulated comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));

		// chain of 4 allpass delays on each of two channels (8 total) :
	4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });

		// add original sound to reverb and play it :
	s+y
}))

//////////////////////////////////////////////////////////////////////////

(
// Mouse control
play({
	SinOsc.ar(MouseX.kr(200, 2000, 'exponential'), 0, 0.4)
}))

//////////////////////////////////////////////////////////////////////////

(
// analog bubbles - with mouse control
play({
	var freq;
	freq = LFSaw.kr(
		MouseY.kr(0.1,10,'exponential'),0,	// lfo 1 rate
		24, 							// lfo 1 depth in semitones
		// lfo 2 in lfo 1's add input :
		LFSaw.kr(
			MouseX.kr(2,40,'exponential'),0,	// lfo 2 rate
			-3, 80					// lfo 2 depth & offset in semitones
		)
	).midicps; // convert to frequency
	CombN.ar(SinOsc.ar(freq, 0, 0.04), 0.2, 0.2, 2) // echoing sine wave
}))

//////////////////////////////////////////////////////////////////////////
