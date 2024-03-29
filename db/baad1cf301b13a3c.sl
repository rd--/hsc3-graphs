{- Envelope used also for the index -}
let f = Latch(
	(SinOsc([100 200 300 550], 0) * 100 + 110).Sum,
	Impulse(7, 0)
);
let e = Decay2(Impulse(7, 0), 0.02, 0.2);
PmOsc(f, f * [1.25, MouseX(1, 3, 0, 0.2)], e * [5, MouseY(3, 9, 0, 0.2)], 0) * e * 0.1
