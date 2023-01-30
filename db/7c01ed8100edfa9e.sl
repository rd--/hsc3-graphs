;; http://earslap.com/weblog/music-release-laconicism.html
var n = { :freq | LfNoise0(freq) };
var f = [60, 61];
var l = n(6);
(BBandPass((n(4).Max(l).Max(SinOsc(f * (l * 9).Ceil.Lag(0.1), 0) * 0.7)), f, n(1).Abs / 2) * 700 * l.Lag(1)).Tanh
