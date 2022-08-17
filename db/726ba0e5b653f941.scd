// http://earslap.com/weblog/music-release-laconicism.html
var a = BPF.ar(Saw.ar([40, 40.001]), LFNoise0.kr(128) + 1 * 4000 + 146, LFNoise1.kr(1) + 1 * 0.05 + 0.01).tanh;
CombC.ar(a, 9, a.abs.lag(2) * 9, a.abs.lag(1) * 100)
