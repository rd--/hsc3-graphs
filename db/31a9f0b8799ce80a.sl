{- http://earslap.com/weblog/music-release-laconicism.html -}
let t = [0 0 0 1 5 7 10 12 12 12] + 30;
let a = Duty(1/8, 0, Drand(inf, t + 24 ++ t ++ t));
(BHiPass(LfNoise1(8) ^ 6, [a, a + 7].MidiCps, a / 3000) * (67 - a)).Tanh
