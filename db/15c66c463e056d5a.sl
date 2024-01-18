{- 20060922 ; rd ; requires=Perc -}
let t0 = Impulse(1 / 0.30, 0);
let t = [t0, TDelay(t0, 0.15)];
let k = TRand(56, 57, t);
let m = (k + 1 + TRand(-1, 1, t)).MidiCps;
let f = SinOsc(k.MidiCps, 0) * TRand(40, 480, t) + m;
SinOsc(f, 0) * Perc(t, 0.01, 0.9, [-4, -4]) * 0.1
