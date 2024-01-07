(* Sos *)
Voicer(1, 16) { :e |
	let b1 = LinLin(e.y, 0, 1, 1.45, 1.998);
	let b2 = LinLin(e.x, 0, 1, -0.999, -0.9998);
	EqPan2(Sos(Trig(K2A(e.w), 0), 0.0, 0.05, 0.0, b1, b2), e.i * 2 - 1) * 8
}.Mix
