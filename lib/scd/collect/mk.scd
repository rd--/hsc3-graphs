// https://sccode.org/1-50L (mk)
var z = PinkNoise.ar();
16.do{
	z = BRF.ar(z, Rand.ir(100, 15000) ! 2, 1)
};
z

// https://sccode.org/1-50L (mk)
var z = PinkNoise.ar();
var lfo = { arg rt;	LFNoise1.ar(rt ! 2) };
16.do{
	z = BRF.ar(
		z,
		Rand.ir(100, 15000) * (0.75 + (lfo.value(Rand.ir(0, 8)) * 0.25)),
		lfo.value(Rand.ir(0, 8)).range(0.05, 1)
	)
};
z

// https://sccode.org/1-50L (mk)
var z =  PinkNoise.ar();
var lfo = { arg rt; LFPulse.ar(rt ! 2, 0, 0.5) };
16.do{
	z = BRF.ar(
		z,
		Rand.ir(100, 15000) * (0.75 + (lfo.value(Rand.ir(0, 0.5)) * 0.25)),
		lfo.value(Rand.ir(0, 0.5)).range(0.05, 1)
	)
};
z

// https://sccode.org/1-50L (mk)
var freq = 100;
var rt = 0.5;
var z = { PinkNoise.ar() } ! 2;
var rw = { arg f1, f2, q;
	4.do {
		z = BRF.ar(
			z,
			Rand.ir(f1, f2).round(10) + (freq * LFNoise1.ar(Rand.ir(0, rt) ! 2)),
			q
		)
	}
};
rw.value(100, 500, 0.1);
rw.value(1000, 2500, 0.2);
rw.value(250, 750, 0.1);
rw.value(2500, 5000, 0.2);
z = FreqShift.ar(
	z,
	Duty.ar(8, 0, Dwhite(-1 * freq * 10, freq * 10, inf).round(freq / 2), 0),
	0
) * 0.25 + z;
z = CombC.ar(z, 1, 1, 8);
LPF.ar(z, LFNoise1.ar(Rand.ir(0, rt) ! 2) * 1250 + 2500)
