// http://earslap.com/weblog/music-release-laconicism.html
var x = Duty.kr(1/8, 0, Drand([0, Drand([0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1], 1)], inf));
LeakDC.ar(BRF.ar(Saw.ar(8) * Decay2.kr(x, 0.01, 0.3) ** 1.5, x * 20 + [45.1, 45], 0.1), 0.995).tanh
