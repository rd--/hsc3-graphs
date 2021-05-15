// analogue daze (commented) ; jmcc
{
// define a function so that I can make a couple of copies of this instrument:
var anaSynFunc = { arg octave, clockRate, pwmrate, fltrate;
	// create a list of frequencies
	var freqList = (
		#[55,63,60,63,57,65,62,65]			// specify in MIDI notes
		+ (12 * octave)					// offset by octaves argument
		).midicps;						// convert to cycles per second
    var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
	// use a sequencer to step through the list of frequencies
	var freq = sequ.value(
			freqList,
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
// analogue snare drum
var snare = Decay.ar(		// an exponential decay envelope
	Impulse.ar(2), 		// impulses trigger envelope at 2 beats per second
	0.15, 			// 0.15 seconds to decay by 60 dB
	LFNoise0.ar(		// step noise used as snare sound
		LFNoise1.kr(0.3,6000,8000),	// sweep the noise frequency between 2000 and 14000 Hz
		[0.07, 0.07])		// amplitude (in stereo, causes whole snare subpatch to be stereo
						//               see MultiChannel.help)
	);
// create two copies of sequencer patch in separate channels
var g = [								// call function f to create each instrument
	anaSynFunc.value(1, 8, 0.31, 0.2),  	// +1 octave,  8 clocks per second, PWM rate, RLPF rate
	anaSynFunc.value(0, 2, 0.13, 0.11)  	// +0 octaves, 2 clocks per second, PWM rate, RLPF rate
	]
	+ snare; // add to snares
// comb delay of input plus dry stereo pair reversed
var z = 0.4 * (				// scale delayed part down
		CombN.ar(			// feedback delay
			g, 			// input dry signal
			0.375, 0.375, 	// 3/8 second delay
			5			// 5 second 60dB decay time
		)
	+ g.reverse );  		// add dry stereo pair with the channels reversed
e = Env.linen(2, 56, 2); // one minute trapezoid envelope
z * EnvGen.kr(e,doneAction:2) 	// wrap a one minute envelope around entire sound
}

// analogue daze (un-commented) ; jmcc
{
var sequ = {arg s, tr; Demand.kr(tr, 0, Dseq(s, inf))};
var pattern = #[55,63,60,63,57,65,62,65];
var f = { arg octave, clockRate, pwmrate, fltrate;
	RLPF.ar( LFPulse.ar( Lag.kr(
				sequ.value(
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
var x = Decay.ar(Impulse.ar(2), 0.15, LFNoise0.ar(LFNoise1.kr(0.3,6000,8000),[0.07,0.07]));
var g = [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)] + x;
var z = 0.4 * (CombN.ar(g, 0.375, 0.375, 5) + g.reverse);
var e = Env.linen(2, 56, 2); // one minute trapezoid envelope
z * EnvGen.kr(e,doneAction:2)
}

// synthetic piano ; jmcc
{
    var n = 6;	// number of keys playing
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
}

// reverberated sine percussion jmc
{
    var d = 10; // number of percolators
    var c = 7; // number of comb delays
    var a = 4; // number of allpass delays
		// sine percolation sound :
	var s = Mix.ar(Array.fill(d, { Resonz.ar(Dust.ar(2/d, 50), 200 + 3000.0.rand, 0.003)}) );
		// reverb predelay time :
	var z = DelayN.ar(s, 0.048);
		// 7 length modulated comb delays in parallel :
	var y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(c,{0.1.rand}), 0.04, 0.05), 15));
		// chain of 4 allpass delays on each of two channels (8 total) :
	a.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
		// add original sound to reverb and play it :
	s+(0.2*y)
}

// reverberated noise bursts ; jmcc
{
		// pink noise percussion sound :
	var s = Decay.ar(Dust.ar(0.6, 0.2), 0.15, PinkNoise.ar);
		// reverb predelay time :
	var z = DelayN.ar(s, 0.048);
		// 6 modulated comb delays in parallel :
	var y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));
		// chain of 4 allpass delays on each of two channels (8 total) :
	4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
		// add original sound to reverb and play it :
	s+y
}

// Mouse control ; jmcc
{
	SinOsc.ar(MouseX.kr(200, 2000, 'exponential'), 0, 0.1)
}

// analog bubbles - with mouse control ; jmcc
{
	var freq = LFSaw.kr(
		MouseY.kr(0.1,10,'exponential'),0,	// lfo 1 rate
		24, 							// lfo 1 depth in semitones
		// lfo 2 in lfo 1's add input :
		LFSaw.kr(
			MouseX.kr(2,40,'exponential'),0,	// lfo 2 rate
			-3, 80					// lfo 2 depth & offset in semitones
		)
	).midicps; // convert to frequency
	CombN.ar(SinOsc.ar(freq, 0, 0.04), 0.2, 0.2, 2) // echoing sine wave
}

//----- textures

(
// native algorhythms
var imp_seq = {arg s, tr; Demand.ar(tr, 0, s) * tr};
var n = 8; 	// n = number of partials for percussion instruments
RTexture.overlap({ // make an overlapping texture
// create an algorhythmic rhythm pattern
var pat = Drand([ // choose one of the following patterns at random
		Dseq([2.0, 0.0, 2.0, 0.0, 1.0, 0.0, 1.0, 1.0],1),
		Dseq([2.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0],1),
		Dseq([2.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0],1),
		Dseq([2.0, 0.3, 0.3, 1.0, 0.3, 0.3, 1.0, 0.3],1),
		Dseq([2.0, 0.0, 0.3, 0.0, 0.3, 0.0, 0.3, 0.0],1),
		Dseq([2.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0],1),
		Dseq([2.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0],1),
		Dseq([0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0],1),
		Dseq([1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0,
			  0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0],1)
	], inf);
		var freq = 40 + 300.0.rand; 		// random base frequency
		var seq = imp_seq.value(		// outputs a sequence of single sample triggers
				pat,
				Impulse.ar(10) 		// a clock for the sequencer at 10 beats per second
			);
		var excitation = Decay.ar( 	// a decaying envelope for the noise
					seq, 			// impulse sequence triggers decay envelopes
					0.1, 			// 60 dB decay time
					PinkNoise.ar(0.01)	// noise is the exciter
			);
		var resonator = Klank.ar( 		// use Klank as a percussion resonator
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
)

//----- drawings

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
