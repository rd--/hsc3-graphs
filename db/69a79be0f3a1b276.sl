/********** Aleatoric quartet ; mouse x controls density ; Jmcc **********/
let amp = 0.07;
let density = MouseX(0.01, 1, 0, 0.2); /* mouse determines density of excitation */
let dmul = density.Recip * 0.5 * amp; /* calculate multiply and add for excitation probability */
let dadd = dmul.Neg + amp;
let signal = Sum( /* mix a list of 4 instruments */
	{
		/* if amplitude is below zero it is clipped, density determines the probability of being above zero */
		let excitation = PinkNoise() * Max(0, LfNoise1(8).MulAdd(dmul, dadd));
		let freq = Lag( /* lag the pitch so it glissandos between pitches */
			LfNoise0( /* use low freq step noise as a pitch control */
				[1, 0.5, 0.25].atRandom /* choose a frequency of pitch change */
			).MulAdd(7, /* +/- 7 semitones */
				66 + 30.Rand2 /* random center note */
			).RoundTo(1), /* round to nearest semitone */
			0.2 /* gliss time */
		).MidiCps; /* convert to hertz */
		EqPan2( /* pan each intrument */
			CombL(excitation, 0.02, 1 / freq, 3), /* comb delay simulates string */
			1.Rand2/* random pan position */
		)
	} ! 4
);
5.timesRepeat { signal := AllpassN(signal, 0.05, [0.05.Rand0, 0.05.Rand0], 1) }; /* add some reverb via allpass delays */
LeakDc(signal, 0.995) /* delays build up a lot of DC, so leak it out here. */
