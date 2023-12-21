(* Sine ; envelope generator ; random duration, frequency & amplitude *)
var tr = Impulse(1, 0);
var freq = TRand(220, 330, tr);
var dur = TRand(0.05, 0.95, tr);
var amp = TRand(0.01, 0.2, tr);
SinOsc(freq, 0) * Sine(tr, dur) * amp
