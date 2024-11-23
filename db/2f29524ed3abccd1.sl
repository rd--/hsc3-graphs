/* 20061008 ; rd */
let x = MouseX(15, 0, 0, 0.1);
let y = MouseY(15, 27, 0, 0.1);
let t = Dust(9).kr;
let b = Choose(t, [36, 48, 60, 72]);
let n = LfNoise1([3, 3.05]) * 0.04;
let d = TiRand(x, y, t);
let e = Decay2(t, 0.005, TRand(0.02, 0.15, t));
let k = DegreeToKey([0, 2, 3.2, 5, 7, 9, 10].asLocalBuf, d, 12);
let f = (b + k + n).MidiCps;
let m = e * SinOsc(f, 0) * 0.2;
let u = PulseDivider(t, 9, 0);
let r0 = TRand(0.0075, 0.125, u);
let r1 = TRand(0.05, 0.15, u);
m * 0.5 + AllpassC(m, 0.15, r0, r1)
