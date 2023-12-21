(* TScramble ; initially unscrambled *)
var tr = Dust(1);
SinOsc(TScramble(tr, [60 62 64 65 67 69 71 72].MidiCps), 0).Splay * 0.1
