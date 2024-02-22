{- Harmonic swimming (Jmcc) -}
let f = 50; {- Fundamental frequency -}
let p = 20; {- Number of partials per channel -}
let z = 0; {- Start of oscil daisy chain -}
let offset = Line(0, -0.02, 60); {- Causes sound to separate and fade -}
1:p.do { :i |
	z := MulAdd(
		FSinOsc(
			f * i, {- Freq of partial -}
			0
		),
		MulAdd(
			LfNoise1(
				{ Rand(2, 8) } ! 2 {- Amplitude rate -}
			),
			0.02, {- Amplitude scale -}
			offset {- Amplitude offset -}
		).Max(0), {- Clip negative amplitudes to zero -}
		z
	)
};
z
