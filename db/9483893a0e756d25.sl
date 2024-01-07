(* phase vocoder (nh) ; https://scsynth.org/t/old-school-vocoders/5198/6 ; warning: AudioIn ; requires=kr *)
let src = AudioIn([1]);
let notes = { Choose(Dust(0.5).kr, 60 + [-9, -7, -5, -3, -2, 0, 2, 3, 5, 7, 9, 10]) } ! 3;
let numBands = 32;
let bandFreqs = LinExp([0 .. numBands - 1], 0, numBands - 1, 100, 8000);
let voicedCarrier = Saw(notes.MidiCps);
let isVoiced = Lag(Lag(ZeroCrossing(src).CpsMidi, 0.05) > 5000.CpsMidi, 0.05);
let carrier = SelectX(isVoiced, [voicedCarrier, PinkNoise()]);
let filterQ = TRand(10, 100, Dust(0.5));
let srcAmp = Amplitude(Bpf(src, bandFreqs, 1 / filterQ), 0.01, 0.05);
let snd = Bpf(carrier, bandFreqs, 0.05) * srcAmp;
EqPan2(snd.Sum, 0) * numBands / 4
