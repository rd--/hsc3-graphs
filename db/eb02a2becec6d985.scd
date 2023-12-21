// TScramble - octaves, swaps channels on impulse, scramble may be identity
var tr = Impulse.kr(1, 0);
SinOsc.ar(TScramble.kr(tr, [220, 440]), 0) * 0.1
