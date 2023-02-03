;; http://earslap.com/weblog/music-release-laconicism.html
var t = [0, 0, 0, 1, 5, 7, 10, 12, 12, 12] + 30;
var a = DmdFor(1/8, 0, Lrand(inf, t + 24 ++ t ++ t));
(BHiPass(LfNoise1(8) ** 6, [a, a + 7].MidiCps, a / 3000) * (67 - a)).Tanh
