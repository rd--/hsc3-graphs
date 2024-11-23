/* https://sonomu.club/@lukiss/110533029814503247 ; Jun 13, 2023 */
let p = [1, 2 .. 14].degreeToKey([0 2 4 7 9], 12).MidiRatio;
let f = SinOsc(p.Sin * 8, 0) * 0.005 + 1 * p * 52;
let h = SinOsc(f * 2, 0) * SinOsc(1 / 4 / p, 0) * SinOsc(pi / p, 0).LinExp(-1, 1, 0.01, 1) * 8 * pi;
let m = LfSaw(-1 * [7, 3.5, 7 / 10] * (SinOsc(f.Sin.LinExp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
let e = m ^ (SinOsc(8 / p / f.ArcTan, 0) * 30 + 32);
let o = SinOsc(f, h) * e;
Splay(0.5 * o, SinOsc(pi, 0))
