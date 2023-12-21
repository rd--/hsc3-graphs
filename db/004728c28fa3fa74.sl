(* LinExp *)
var tr = Dust(2 / [3, 5]);
var note = TRand(48, 72, tr);
var freq = Lag(note.MidiCps, 0.05);
var env = Decay2(tr, 0.005, TRand(0.1, 0.9, tr)) * 0.2;
var lfo = LinExp(SinOsc(0.12, 0), -1, 1, 300, 8000);
var snd = LfSaw(freq + [0, 1], 0);
2.timesRepeat {
	snd := Rlpf(snd, lfo, 0.2).SoftClip
};
snd * env
