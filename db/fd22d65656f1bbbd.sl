/* TScramble ; octaves, swaps channels on impulse, scramble may be identity */
let tr = Impulse(1, 0);
SinOsc(TScramble(tr, [220, 440]), 0) * 0.1
