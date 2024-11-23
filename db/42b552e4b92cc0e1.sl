/* http://earslap.com/weblog/music-release-laconicism.html ; requires=kr */
let x = Duty(1 / 8, 0, Drand(inf, [0, Drand(1, [0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1])]));
LeakDc(Brf(Saw(8) * Decay2(x, 0.01, 0.3).kr ^ 1.5, x * 20 + [45.1, 45], 0.1), 0.995).Tanh
