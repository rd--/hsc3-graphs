;; Seq ; the SC2 Sequencer UGen is somewhat like the DmdOn & Seq idiom below
var tr = Impulse(6, 0);
var n0 = DmdOn(tr, 0, Lseq(inf, [60, 62, 63, 58, 48, 55]));
var n1 = DmdOn(tr, 0, Lseq(inf, [63, 60, 48, 62, 55, 58]));
LfSaw([n0, n1].MidiCps, 0) * 0.05
