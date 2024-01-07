// aleatoric quartet - mouse x controls density ; jmcc
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
