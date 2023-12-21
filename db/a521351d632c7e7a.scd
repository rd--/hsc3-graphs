// TScramble ; initially unscrambled
var tr = Dust.kr(1);
SinOsc.ar(TScramble.kr(tr, [60, 62, 64, 65, 67, 69, 71, 72].midiCps), 0).splay2 * 0.1
