(* Analog bubbles (Jmcc) ; alternate linearisation *)
[8, 7.23].LfSaw(0)
	.MulAdd(3, 80)
	.Add(0.4
		 .LfSaw(0)
		 .Mul(24)
	)
	.MidiCps
	.SinOsc(0)
	.Mul(0.05)
	.CombN(0.2, 0.2, 4)
	.Mul(0.1)
