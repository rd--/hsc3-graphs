/* http://sccode.org/1-4Qy (F0) ; 0355 */
let b = 1:9;
let o = LfSaw(LfSaw(9, 2 / b), 0) > 0.05 * GrayNoise() * 999 * LfSaw(440, 0);
MoogFf(o, 2 ^ LfSaw(b / 3.55, 0).RoundTo(1) * b * 99, 3.5, 0).Splay.Tanh / 9
