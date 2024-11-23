/* Griot modeling (Jmcc) */
let maxDt = 48000 * 0.03; /* Maximum delay time */
let n = 5; /* Number of delay lines */
let buf = { BufAlloc(1, maxDt).BufClear } ! n; /* Allocate buffers for delay lines */
let tapTimes = n.arithmeticSeries(0.003, 0.0005); /* Tap times to determine string pitches */
let exc = (1 .. n).collect { :i |
	let excEnv = Env([0 1 0], [0.01 0.2], -2, nil, nil, 0);
	let excTrig = Impulse(n, 0);
	let excCh = Demand(excTrig, 0, Dbrown(inf, 0, n - 1, 1));
	let excFr = MouseY(10, 10000, 0, 0.2);
	let excSg = LfNoise2(excFr) * excEnv.asEnvGen(excTrig) * Rand(0, 0.1);
	excSg * ((excCh - i).Abs < 1)
};
let del = (1 .. n).collect { :i |
	DelayTap(buf[i], tapTimes[i]) /* Tap the delay lines */
};
let flt = Lpf(del, MouseX(10, 10000, 0, 0.2)) * 0.98; /* Filter the taps */
(1 .. n).collect { :i |
	flt[i] <! DelayWrite(buf[i], flt[i] + exc[i]) /* Write to delay lines */
}.sum # 2
