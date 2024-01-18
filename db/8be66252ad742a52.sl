{- harmonic swimming ; jmcc -}
let f = 50; {- fundamental frequency -}
let p = 20; {- number of partials per channel -}
let z = 0; {- start of oscil daisy chain -}
let offset = Line(0, -0.02, 60); {- causes sound to separate and fade -}
(1 .. p).do { :i |
	z := MulAdd(
		FSinOsc(
			f * i, {- freq of partial -}
			0
		),
		MulAdd(
			LfNoise1(
				{ Rand(2, 8) } ! 2 {- amplitude rate -}
			),
			0.02, {- amplitude scale -}
			offset {- amplitude offset -}
		).Max(0), {- clip negative amplitudes to zero -}
		z
	)
};
z
