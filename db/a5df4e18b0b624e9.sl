{- Deepsea (jrhb) -}
let amp = 0.1;
let variation = 0.9;
let tr = Dust(0.25);
let n = TRand(7, 46, tr);
let dt = 25.0 + TRand(-1.7, 1.7, tr) + LfNoise2(2) * variation * 0.001;
let freq = 901 + TRand(0, 65, tr);
let t = Impulse(dt.Recip, 0) * 100;
let count = PulseCount(t, 0);
let u = Bpf(
	Bpf(count < n * t, freq, 0.1),
	freq * (count % LinLin(LfNoise1(1), -1, 1, 2, 20) + 1),
	0.2
);
let f1 = Bpf(
	EqPan(u, TRand(-1, 1, tr)) * amp * 50,
	700,
	0.1
);
let f2 = CombL(
	Lpf(f1 * LfNoise1(0.1).Max(0), 800),
	0.5,
	0.5,
	1
) + f1.reversed;
let f3 = f2;
5.timesRepeat {
	f3 := AllpassN(f3, 0.18, { 0.06.Rand0 } ! 2 + 0.06, 8)
};
Lpf(f2 + f3, 400) + (LfNoise1(0.2) * f2)
