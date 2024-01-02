(* Pluck ; https://scsynth.org/t/4318/17 *)
var freq = LfNoise2(1);
var trig = Impulse(LinExp(freq, -1, 1, 1, 100), 0);
var freqs = (60.5 + [0 2 4 5 7 9 10]).MidiCps;
var snd = Pluck(Hasher(Sweep(trig, 1)) * -10.DbAmp, trig, 1 / freqs, 1 / freqs, 0.9, 0.5);
snd := LeakDc(snd, 0.995).Sum;
snd := MoogFf(snd, LinExp(LfNoise2(1), -1, 1, 500, 16000), 0, 0);
EqPan(snd, freq)