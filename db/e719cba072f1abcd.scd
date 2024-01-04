// TScramble ; octaves, swaps channels on impulse, scramble may be identity ; audio rate
var tr = Impulse.ar(1, 0);
SinOsc.ar(TScramble.ar(tr, [222, 444]), 0) * 0.1
