{-********* Harmonic tumbling ; Jmcc *********-}
let f = 80; {- fundamental frequency -}
let p = 10; {- number of partials per channel -}
let z = 0; {- start of oscil daisy chain -}
let trig = XLine([10, 10], 0.1, 60); {- trigger probability decreases over time -}
(1 .. p).do { :i |
	z := SinOsc(
		f * i, 0).MulAdd( {- freq of partial -}
			Decay2(
				Dust(trig) {- trigger rate -}
				* 0.02, {- trigger amplitude -}
				0.005, {- grain attack time -}
				0.5.Rand0 {- grain decay time -}
			),
			z
		)
};
z
