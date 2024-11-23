/* Analog bubbles (Jmcc) */
let f = MulAdd(
	LfSaw(0.4, 0),
	24,
	MulAdd(LfSaw([8, 7.23], 0), 3, 80)
).MidiCps; /* Glissando function */
CombN(SinOsc(f, 0) * 0.05, 0.2, 0.2, 4) /* Echoing sine wave */
