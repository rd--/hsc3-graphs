/* http://earslap.com/weblog/music-release-laconicism.html */
let a = Bpf(Saw([40, 40.001]), LfNoise0(128) + 1 * 4000 + 146, LfNoise1(1) + 1 * 0.05 + 0.01).Tanh;
CombC(a, 9, a.Abs.Lag(2) * 9, a.Abs.Lag(1) * 100)
