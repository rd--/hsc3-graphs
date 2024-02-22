{- Pretty nice but inessential ; Rand -}
1:12.collect { :i |
	let freq = MouseX(Rand(0.1, 5), Rand(3, 20), 0, 0.2);
	let amp = LfNoise0(MouseX(Rand(1, 6), Rand(1, 6), 0, 0.2)).Max(0);
	let osc = SinOsc(SinOsc(freq, 0) * MouseY(10, 50, 0, 0.2) + Rand(200, 5000), 0) * amp;
	Pan2(osc, 1.Rand2, 0.03)
}.Mix
