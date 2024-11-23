/********** Berlin 1977 ; mouse x controls clock rate ; Jmcc **********/
let clockRate = MouseX(5, 20, 0, 0.2);
let clockTime = 1 / clockRate;
let clock = Impulse(clockRate, 0); /* sequencer trigger */
let patternList = [55 60 63 62 60 67 63 58];
let note = Sequencer(patternList, clock); /* midi note pattern sequencer */
let octNote = Sequencer( /* every 16 beats transpose somewhat randomly */
	[-12 -7 -5 0 2 5].shuffled, /* function called at each trigger */
	PulseDivider(clock, 16, 0) /* divide clock by 16 */
) + note; /* add transpose to note */
let freq = octNote.MidiCps; /* convert midi note to cycles per second */
let amp = Decay2(clock, 0.05 * clockTime, 2 * clockTime).MulAdd(0.1, 0.02); /* amplitude envelope */
let filt = Decay2(clock, 0.05 * clockTime, 2 * clockTime).MulAdd(SinOsc(0.17, 0) * 800, 1400); /* filter envelope scaled by Lfo */
CombN(
	Rlpf(
		Pulse( /* for better quality replace 'LfPulse' with 'Pulse' */
			freq,
			SinOsc(0.08, [0, 0.5.pi]).MulAdd(0.45, 0.5) /* pulse width LfO(s) */
		) * amp,
		filt,
		0.15 /* 1/Q */
	),
	0.2,
	[0.2, 0.17],
	1.5 /* max delay, actual delay(s), decay time */
)
