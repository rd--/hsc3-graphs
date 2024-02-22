{- Harmonic tumbling (Jmcc) -}
let f = 80; {- Fundamental frequency -}
let p = 10; {- Number of partials per channel -}
let z = 0.0; {- Start of oscil daisy chain -}
let trig = XLine([10, 10], 0.1, 60); {- Trigger probability decreases over time -}
1:p.do { :i |
	z := MulAdd(
		FSinOsc(
			f * i, {- Freq of partial -}
			0
		),
		Decay2(
			Dust(
				trig {- Trigger rate -}
			) * 0.02, {- Trigger amplitude -}
			0.005, {- Grain attack time -}
			0.5.Rand0 {- Grain decay time -}
		),
		z
	)
};
z
