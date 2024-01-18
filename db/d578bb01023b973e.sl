{- TLine -}
let tr = Impulse(1, 0);
let f0 = TRand(220, 330, tr);
let f1 = TRand(110, 440, tr);
let dur = TRand(0.1, 1, tr);
let f = TLine(f0, f1, dur, tr);
let e = Sine(tr, dur) * 0.1;
SinOsc(f, 0) * e
