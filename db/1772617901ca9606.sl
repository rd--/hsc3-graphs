{- Sine ; envelope generator ; random duration, frequency & amplitude -}
let tr = Impulse(1, 0);
let freq = TRand(220, 330, tr);
let dur = TRand(0.05, 0.95, tr);
let amp = TRand(0.01, 0.2, tr);
SinOsc(freq, 0) * Sine(tr, dur) * amp
