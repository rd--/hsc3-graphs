// Choip choip choip ; Jmcc ; graph re-write (Rd)
var t = 12;
var z = OverlapTexture({ |tr|
	var impulses = Impulse.ar(
		TxLine.kr(TExpRand.kr(1,30,tr), TExpRand.kr(1,30,tr), t, tr)
	);
	var f = TxLine.kr(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), t, tr);
	Pan2.ar(
		Decay2.ar(
			impulses * TxLine.kr(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), t, tr),
			0.01,
			0.2,
			SinOsc.ar(Decay2.ar(impulses, 0.05, 0.5, -0.9*f, f))
		),
		TLine.kr(TRand.kr(-1,1,tr), TRand.kr(-1,1,tr), t, tr)
	);
}, t - 2, 1, 8, 2);
4.do { z = AllpassN.ar(z, 0.1, [Rand(0,0.05),Rand(0,0.05)], 4) };
z
