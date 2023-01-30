;; TScramble ; octaves, swaps channels on impulse, scramble may be identity
var tr = Impulse(1, 0);
SinOsc(TScramble(tr, [220, 440]), 0) * 0.1
