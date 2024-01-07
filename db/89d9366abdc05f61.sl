(* http://earslap.com/weblog/music-release-laconicism.html ; wait *)
let q = [0 3 5 7 10];
let t = Impulse(4, 0) * LfNoise0(500) > 0;
let f = Demand(t, 0, Drand(inf, (q + 12 ++ q + 33).MidiCps));
PitchShift(Saw(f) * Decay(t, 3), 7, 2, 0, 0)
