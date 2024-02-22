// http://earslap.com/weblog/music-release-laconicism.html ; wait
var q = [0, 3, 5, 7, 10];
var t = Impulse.kr(4, 0) * LFNoise0.kr(500) > 0;
var f = Demand.kr(t, 0, Drand((q + 12 ++ q + 33).midicps, inf));
PitchShift.ar(Saw.ar(f) * Decay.kr(t, 3), 7, 2, 0, 0).dup(2)
