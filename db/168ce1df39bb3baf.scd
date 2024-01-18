// http://earslap.com/weblog/music-release-laconicism.html
var t = Impulse.ar(8, 0) * LFNoise1.ar(2);
CombL.ar((Saw.ar([3, 4]) * Decay.ar(t, 0.1)).tanh, 1, TRand.ar(0, 0.01, t).round(0.00015), TRand.ar(-30, 30, t))
