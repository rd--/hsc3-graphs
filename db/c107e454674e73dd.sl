(* LinExp *)
let tr = Dust(2 / [3, 5]);
let note = TRand(48, 72, tr);
let freq = Lag(note.MidiCps, 0.05);
let env = Decay2(tr, 0.005, TRand(0.1, 0.9, tr)) * 0.2;
let lfo = LinExp(SinOsc(0.12, 0), -1, 1, 300, 8000);
let snd = LfSaw(freq + [0, 1], 0);
2.timesRepeat {
	snd := Rlpf(snd, lfo, 0.2).SoftClip
};
snd * env
