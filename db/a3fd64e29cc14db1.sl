;; Sos
Voicer(16, { :e |
	var b1 = LinLin(e.y, 0, 1, 1.45, 1.998);
	var b2 = LinLin(e.x, 0, 1, -0.999, -0.9998);
	EqPan2(Sos(Trig(K2A(e.w), 0), 0.0, 0.05, 0.0, b1, b2), e.o * 2 - 1) * 8
}).sum
