(* metal plate (jmcc) #4 *)
var n = 4; (* number of delay lines *)
var maxTm = 0.03; (* maximum delay time *)
var buf = { LocalBuf(1, 48000 * 0.03).ZeroBuf } ! n; (* allocate buffers for delay lines *)
var tapTm = { Rand(0.015, maxTm) } ! n; (* assign random tap times *)
var excFreq = MouseY(10, 8000, 0, 0.2); (* excitation *)
var excTrig = Impulse(0.5, 0) * 0.1;
var exc = Decay2(excTrig, 0.01, 0.2) * LfNoise2(excFreq);
var del = (1 .. n).collect { :i |
	DelayTap(buf[i], tapTm[i]) (* tap the delay lines *)
};
var fltFreq = MouseX(10, 5000, 0, 0.2); (* filter the taps *)
var pan = TRand(-1 / 3, 1 / 3, excTrig); (* pan location *)
var flt = Lpf(del, fltFreq) * 0.98;
(1 .. n).collect { :i |
	flt[i] <! DelayWrite(buf[i], flt[i] + exc) (* write to delay lines *)
}.Sum.EqPan2(pan)
