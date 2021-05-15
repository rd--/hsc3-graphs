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
