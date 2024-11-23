/********** synthetic piano ; Jmcc **********/
let n = 6; /* number of keys playing */
{ /* mix an list of notes */
	let pitch = (36 + 54.Rand0); /* calculate delay based on a random note */
	let strike = Impulse(0.1 + 0.4.Rand0, 0) * 0.1; /* random period for each key */
	let hammerEnv = Decay2(strike, 0.008, 0.04); /* excitation envelope */
	EqPan2(
		/* list of 3 strings per note */
		1:3.collect { :i |
			/* detune strings, calculate delay time */
			let detune = [-0.05, 0, 0.04].at(i);
			let delayTime = 1 / (pitch + detune).MidiCps;
			/* each string gets own exciter */
			let hammer = LfNoise2(3000) * hammerEnv; /* 3000 Hz was chosen by ear */
			CombL(hammer, /* used as a string resonator */
				delayTime, /* max delay time */
				delayTime, /* actual delay time */
				6) /* decay time of string */
		},
		(pitch - 36) / 27 - 1 /* pan position: lo notes left, hi notes right */
	).sum
} !> n
