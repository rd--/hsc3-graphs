// griot modeling (jmcc)
var maxDt = 48000 * 0.03; // maximum delay time -- Server.default.sampleRate
var n = 5; // number of delay lines
var buf = { LocalBuf(maxDt, 1).clear } ! n; // allocate buffers for delay lines
var tapTimes = Array.series(n, 0.003, 0.0005); // assign tap times which determine the string pitches
var exc = (0 .. n - 1).collect { | i |
	var excEnv = Env([0, 1, 0], [0.01, 0.2], -2, nil, nil, 0); // excitation (brownian, jmcc has melody)
	var excTrig = Impulse.kr(n, 0);
	var excCh = Demand.kr(excTrig, 0, Dbrown.dr(0, n - 1, 1, inf));
	var excFr = MouseY.kr(10, 10000, 0, 0.2);
	var excSg = LFNoise2.ar(excFr) * EnvGen.kr(excEnv, excTrig, 0.1.rand, 0, 1, 0);
	excSg * ((excCh - i).abs < 1)
};
var del = (0 .. n - 1).collect { | i |
	Tap.ar(buf[i], 1, tapTimes[i])
}; // tap the delay lines
var flt = LPF.ar(del, MouseX.kr(10, 10000, 0, 0.2)) * 0.98; // filter the taps
(0 .. n - 1).collect { | i |
	flt[i] <! RecordBuf.ar(flt[i] + exc[i], buf[i], 0, 1, 0, 1, 1, 1, 0) // write to delay lines
}.sum.dup
