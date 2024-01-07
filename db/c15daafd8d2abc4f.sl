let t = Impulse(4, 0);
let r = TrigRoundRobin(5, t);
let f = TiRand(48, 72, r).MidiCps;
let e = Decay2(r, 0.05, 2);
let o = SinOsc(f, 0) * e;
o.Splay
