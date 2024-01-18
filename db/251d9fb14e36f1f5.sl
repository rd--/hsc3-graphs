{- TChoose ; select input at trigger -}
let x = MouseX(1, 1000, 1, 0.1);
let t = Dust(x);
let f = TiRand(48, 60, t).MidiCps;
let o = TChoose(t, [SinOsc(f, 0), Saw(f * 2), Pulse(f * 0.5, 0.1)]);
o * 0.1
