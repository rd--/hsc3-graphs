"overlap-texture.scd".loadRelative; /* SC3 variants of OverlapTexture &etc. - rd */

/*
These examples are all surrounded by parentheses. You can double click to the right
of the first open paren to select the entire example. Then press the 'enter' key to
execute it. To stop execution, press cmd-period (i.e. the Apple key and the '.' key).

These  examples all demonstrate sound input processing, so you might want
to test these with a CD playing.
*/

//////////////////////////////////////////////////////////////////////////

(
// input thru
Synth.scope({ AudioIn.ar([1,2]) })
)

//////////////////////////////////////////////////////////////////////////

(
// distort input
Synth.scope({
	var gain;
	gain = MouseX.kr(1,100,'exponential');	// mouse x controls gain into distortion
	AudioIn.ar([1,2], gain).distort * 0.4
}))

//////////////////////////////////////////////////////////////////////////

(
// ring modulate input
Synth.scope({
	var input, modulator;
	input = AudioIn.ar([1,2]);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	input * modulator
}))

//////////////////////////////////////////////////////////////////////////

(
// ring modulate input using ring1
Synth.scope({
	var input, modulator;
	input = AudioIn.ar([1,2], 0.5);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	input ring1: modulator
}))

//////////////////////////////////////////////////////////////////////////

(
// filter the input
Synth.scope({
	var rQ;
	rQ = MouseY.kr(0.01, 1, 'exponential'); // bandwidth ratio = 1/Q
	RLPF.ar(
		AudioIn.ar([1,2], 0.4 * rQ.sqrt),		// attenuate to offset resonance
		MouseX.kr(100, 12000, 'exponential'), 	// mouse x controls cutoff freq
		rQ
	)
}))

//////////////////////////////////////////////////////////////////////////

(
// input limiter
Synth.scope({
	CompanderD.ar(
		AudioIn.ar([1,2]),
		MouseX.kr(0.01, 0.5), 		// threshold
		1, 		// below threshold slope
		0.1		// above threshold slope
	)
},
0.1	// scope buf size
))

//////////////////////////////////////////////////////////////////////////

(
// input noise gate
Synth.scope({
	var input;
	input = AudioIn.ar([1,2]);
	Compander.ar(
		input, input,
		MouseX.kr(0.01, 0.5), 		// threshold
		10, 		// below threshold slope
		1		// above threshold slope
	)
},
0.1	// scope buf size
))

//////////////////////////////////////////////////////////////////////////

(
// pitch shift input
play({
	PitchShift.ar(
		AudioIn.ar([1,2],0.5),	// stereo audio input
		0.04, 			// grain size
		MouseX.kr(0,2), // mouse x controls pitch shift ratio
		0, 			// pitch dispersion
		0.004			// time dispersion
	)
}))

//////////////////////////////////////////////////////////////////////////

(
// use PitchShift to granulate input
// upper left corner is normal playback. x = pitch dispersion, y = time dispersion
play({
	var grainSize;
	grainSize = 0.1;
	PitchShift.ar(
		AudioIn.ar([1,2],0.5),
		grainSize,
		1,					// nominal pitch rate = 1
		MouseX.kr(0,1), 		// pitch dispersion
		MouseY.kr(0, grainSize)	// time dispersion
	)
}))

//////////////////////////////////////////////////////////////////////////

(
// echo input
play({
	var in;
	in = AudioIn.ar([1,2], 0.1);
	CombL.ar(
		in,
		0.5, 				// max delay time
		MouseX.kr(0,0.5),	// mouse x controls delay time
		4,				// echo 60 dB decay time in seconds
		1, 				// scale by unity
		in				// mix with input
	)
}))

//////////////////////////////////////////////////////////////////////////

(
// ring modulate & echo input
play({
	var in;
	in = AudioIn.ar([1,2], 0.4) * SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi]);
	CombL.ar(
		in,
		0.5,
		MouseY.kr(0,0.5),	// mouse y controls delay time
		4,				// echo 60 dB decay time in seconds
		1, 				// scale by unity
		in				// mix with input
	)
}))

//////////////////////////////////////////////////////////////////////////

(
// ring modulated and resonant filtered input
Synth.scope({
	var input, modulator;
	input = AudioIn.ar([1,2],0.2);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	RLPF.ar(
		input * modulator, 					// do ring modulation
		MouseY.kr(100, 12000, 'exponential'), 	// mouse y controls cutoff freq
		0.1)								// bandwidth ratio = 1/Q
}))

//////////////////////////////////////////////////////////////////////////

(
// distort, ring modulate & echo input - a real noise fest
Synth.scope({
	var in;
	in = AudioIn.ar([1,2], 20).distort.ring1(
			SinOsc.ar(MouseX.kr(10,2000,'exponential'), [0,0.5pi])
		) * 0.02;
	CombL.ar(
		in,
		0.5,
		MouseY.kr(0,0.5), // mouse y controls delay time
		4,
		1,
		in
	)
}))

//////////////////////////////////////////////////////////////////////////

// this one is better to use with a microphone and headphones.

(
// loop recorder - previous delay contents are ducked when there is new input
Synth.play({ arg synth;
	var bufL, bufR, maxCycleTime, input, recycle, threshhold, inputAmp, chanSelect, output;

	maxCycleTime = 1;	// buffer loop length
	threshhold = 0.05;	// noise gating threshold

	// allocate delay lines
	bufL = Signal.new(Synth.sampleRate * maxCycleTime + synth.blockSize);
	bufR = Signal.new(Synth.sampleRate * maxCycleTime + synth.blockSize);

	input = AudioIn.ar([1,2]);
	recycle = TapN.ar([bufL, bufR], maxCycleTime);

	// select between rerecording previous delay line data or new input
	// depending on input amplitude
	inputAmp = Amplitude.kr(input);
	chanSelect = Lag.kr(inputAmp > threshhold, 0.1);
	output = (input * chanSelect) + (recycle * (1 - chanSelect));

	DelayWr.ar([bufL, bufR], output);
	output
}))

//////////////////////////////////////////////////////////////////////////

(
// sweep verb

play({
	var s, z, y;

	s = AudioIn.ar([1,2], 0.01) ;

		// reverb predelay time :
	z = DelayN.ar(Mix.ar(s), 0.048);

		// 6 modulated comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));

		// chain of 4 allpass delays on each of two channels (8 total) :
	4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });

	// eliminate DC
	LeakDC.ar(y)
}))


//////////////////////////////////////////////////////////////////////////

(
// monastic resonance
// mouse controls size and reverb time

play({
	var s, z, y, decayTime, delayScale;

	decayTime = MouseX.kr(0,16);
	delayScale = MouseY.kr(0.01, 1);

	s = AudioIn.ar([1,2], 0.005) ;

		// reverb predelay time :
	z = DelayN.ar(Mix.ar(s), 0.048);

		// 8 comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, Array.fill(8,{0.04.rand2 + 0.05}) * delayScale, decayTime));

		// chain of 5 allpass delays on each of two channels (10 total) :
	5.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });

	// eliminate DC
	LeakDC.ar(y)
}))
