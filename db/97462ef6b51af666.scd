// Analogue daze (commented) ; Jmcc
// define a function so that I can make a couple of copies of this instrument:
var anaSynFunc = { arg octave, clockRate, pwmrate, fltrate;
	// create a list of frequencies
	var freqList = (
		#[55,63,60,63,57,65,62,65]			// specify in MIDI notes
		+ (12 * octave)					// offset by octaves argument
	).midicps;						// convert to cycles per second
	// use a sequencer to step through the list of frequencies
	var freq = Sequencer.kr(
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
