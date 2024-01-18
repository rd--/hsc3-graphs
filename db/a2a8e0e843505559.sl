{- Sine ; mouse control -}
let f = MouseX(0.25, 8, 0, 0.2);
let a = MouseY(0.05, 0.1, 0, 0.2);
let tr = Impulse(f, 0);
SinOsc(TRand(220, 440, tr), 0) * Sine(tr, 1 / f) * a
