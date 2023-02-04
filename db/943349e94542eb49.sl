;; http://earslap.com/weblog/music-release-laconicism.html ; wait
var q = [0, 3, 5, 7, 10];
var t = Impulse(4, 0) * LfNoise0(500) > 0;
var f = Demand(t, 0, Drand(inf, (q + 12 ++ q + 33).MidiCps));
PitchShift(Saw(f) * Decay(t, 3), 7, 2, 0, 0) ! 2
