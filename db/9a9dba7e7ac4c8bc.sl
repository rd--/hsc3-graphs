(* metal plate (jmcc) #4 *)
let n = 4; (* number of delay lines *)
let maxTm = 0.03; (* maximum delay time *)
let buf = { LocalBuf(1, 48000 * 0.03).ZeroBuf } ! n; (* allocate buffers for delay lines *)
let tapTm = { Rand(0.015, maxTm) } ! n; (* assign random tap times *)
let excFreq = MouseY(10, 8000, 0, 0.2); (* excitation *)
let excTrig = Impulse(0.5, 0) * 0.1;
let exc = Decay2(excTrig, 0.01, 0.2) * LfNoise2(excFreq);
let del = (1 .. n).collect { :i |
	DelayTap(buf[i], tapTm[i]) (* tap the delay lines *)
};
let fltFreq = MouseX(10, 5000, 0, 0.2); (* filter the taps *)
let pan = TRand(-1 / 3, 1 / 3, excTrig); (* pan location *)
let flt = Lpf(del, fltFreq) * 0.98;
(1 .. n).collect { :i |
	flt[i] <! DelayWrite(buf[i], flt[i] + exc) (* write to delay lines *)
}.Sum.EqPan2(pan)
