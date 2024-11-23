/* http://earslap.com/weblog/music-release-laconicism.html */
let f = [60, 61];
let l = LfNoise0(6);
let o = (LfNoise0(4).Max(l).Max(SinOsc(f * (l * 9).Ceiling.Lag(0.1), 0) * 0.7));
(BBandPass(o, f, LfNoise0(1).Abs / 2) * 700 * l.Lag(1)).Tanh
