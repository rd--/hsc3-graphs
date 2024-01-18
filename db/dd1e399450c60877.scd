// Perc ; c.f. Asr for gate variant
Splay.ar({
	var t = Dust.ar(1 / 4);
	SinOsc.ar(TRand.ar(200, 500, t), 0) * Perc.ar(t, 0.01, 4, -4) * 0.2
} ! 9)
