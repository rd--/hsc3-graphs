// RTScramble - octaves, swaps channels on impulse, scramble may be identity
{var tr = Impulse.kr(1,0)
;SinOsc.ar(RTScramble.kr(tr,[220,440]),0) * 0.1}
