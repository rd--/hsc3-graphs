{- Metal plate (Jmcc) #4 -}
let n = 4; {- Number of delay lines -}
let maxTm = 0.03; {- Maximum delay time -}
let buf = { LocalBuf(1, 48000 * 0.03).ZeroBuf } ! n; {- Allocate buffers for delay lines -}
let tapTm = { Rand(0.015, maxTm) } ! n; {- Assign random tap times -}
let excFreq = MouseY(10, 8000, 0, 0.2); {- Excitation -}
let excTrig = Impulse(0.5, 0) * 0.1;
let exc = Decay2(excTrig, 0.01, 0.2) * LfNoise2(excFreq);
let del = (1 .. n).collect { :i |
	DelayTap(buf[i], tapTm[i]) {- Tap the delay lines -}
};
let fltFreq = MouseX(10, 5000, 0, 0.2); {- Filter the taps -}
let pan = TRand(-1 / 3, 1 / 3, excTrig); {- Pan location -}
let flt = Lpf(del, fltFreq) * 0.98;
(1 .. n).collect { :i |
	flt[i] <! DelayWrite(buf[i], flt[i] + exc) {- Write to delay lines -}
}.Sum.EqPan2(pan)
