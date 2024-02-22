{-********* Harmonic swimming ; Jmcc *********-}
let f = 50; {- fundamental frequency -}
let p = 20; {- number of partials per channel -}
let z = 0; {- start of oscil daisy chain -}
let offset = Line(0, -0.02, 60); {- causes sound to separate and fade -}
1:p.do { :i |
	z := SinOsc(
		f * i, 0).MulAdd( {- freq of partial -}
			Max(0, {- clip negative amplitudes to zero -}
				LfNoise1(
					6 + [4.Rand2, 4.Rand2]).MulAdd( {- amplitude rate -}
						0.02, {- amplitude scale -}
						offset {- amplitude offset -}
					)
			),
			z
		)
};
z
