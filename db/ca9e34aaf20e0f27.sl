/* Analog bubbles (Jmcc) ; Method notation */
0.4
.LfSaw(0)
.MulAdd(
	24,
	[8, 7.23]
	.LfSaw(0)
	.MulAdd(3, 80)
)
.MidiCps
.SinOsc(0)
.Mul(0.04)
.CombN(0.2, 0.2, 4)
.Mul(0.1)
