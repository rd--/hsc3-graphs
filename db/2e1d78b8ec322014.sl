/* http://twitter.com/earslap/status/5430344275 */
let n = { :freq | LfNoise0(freq) };
let f = [60, 61];
let l = n(6);
let o = SinOsc(f * (l * 9).Ceiling.Lag(0.1), 0) * 0.7;
let p = n(4).Max(l).Max(o);
let q = BBandPass(p, f, n(1).Abs / 2);
(q * 700 * l.Lag(1)).Tanh
