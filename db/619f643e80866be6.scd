// http://earslap.com/weblog/music-release-laconicism.html
var snd = HPF.ar(Pulse.ar([[0.1, 0.11], [0.12, 0.13]], 0.6) * 0.005, 99);
Mix(HPF.ar(MidEQ.ar(Limiter.ar(GVerb.ar(snd, [[1, 5 / 4], [1.5, 2]], 99, 0.5, 0.5, 15, 1, 0,7, 0.5) * 300, 1, 0.01), 9000, 0.9, 9), 200)).flop.sum
