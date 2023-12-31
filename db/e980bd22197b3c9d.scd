// metal plate (jmcc) #4
var n = 4; // number of delay lines
var maxDt = 48000 * 0.03; // maximum delay time -- Server.default.sampleRate
var buf = { LocalBuf(maxDt, 1).clear } ! n; // allocate buffers for delay lines
var tapTm = { Rand(0.015, 0.03) } ! n; // assign random tap times
var excFreq = MouseY.kr(10, 8000); // excitation
var excTrig = Impulse.ar(0.5, 0) * 0.2;
var exc = Decay2.ar(excTrig, 0.01, 0.2) * LFNoise2.ar(excFreq);
var del = (0 .. n - 1).collect { | i |
	Tap.ar(buf[i], 1, tapTm[i]) // tap the delay lines
};
var fltFreq = MouseX.kr(10, 5000); // filter the taps
var flt = LPF.ar(del, fltFreq, 0.98);
var wr = (0 .. n - 1).collect { | i |
	RecordBuf.ar(flt[i] + exc, buf[i], 0, 1, 0, 1, 1, 0) // write to delay lines
};
Mix.ar(flt <! wr) ! 2
