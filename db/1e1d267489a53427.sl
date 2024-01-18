{- 20060922 ; rd ; requires=Perc -}
let t0 = Impulse(1 / 0.30, 0);
let t1 = TDelay(t0, 0.15);
let t = [t0, t1];
let k = TRand(56, 57, t);
let i = TRand(40, 480, t);
let j = TRand(-1, 1, t);
let c = k.MidiCps;
let m = (k + 1 + j).MidiCps;
let e = Perc(t, 0.01, 0.9, [-4, -4]);
let f = SinOsc(c, 0) * i + m;
SinOsc(f, 0) * e * 0.1
