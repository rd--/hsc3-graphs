(* griot modeling (jmcc) *)
var maxDt = 48000 * 0.03; (* maximum delay time *)
var n = 5; (* number of delay lines *)
var buf = { BufAlloc(1, maxDt).BufClear } ! n; (* allocate buffers for delay lines *)
var tapTimes = n.arithmeticSeries(0.003, 0.0005); (* tap times to determine string pitches *)
var exc = (1 .. n).collect { :i |
	var excEnv = Env([0 1 0], [0.01 0.2], -2, nil, nil, 0);
	var excTrig = Impulse(n, 0);
	var excCh = Demand(excTrig, 0, Dbrown(inf, 0, n - 1, 1));
	var excFr = MouseY(10, 10000, 0, 0.2);
	var excSg = LfNoise2(excFr) * excEnv.asEnvGen(excTrig) * Rand(0, 0.1);
	excSg * ((excCh - i).Abs < 1)
};
var del = (1 .. n).collect { :i |
	DelayTap(buf[i], tapTimes[i]) (* tap the delay lines *)
};
var flt = Lpf(del, MouseX(10, 10000, 0, 0.2)) * 0.98; (* filter the taps *)
(1 .. n).collect { :i |
	flt[i] <! DelayWrite(buf[i], flt[i] + exc[i]) (* write to delay lines *)
}.sum ! 2
