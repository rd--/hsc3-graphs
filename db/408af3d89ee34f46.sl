{- Rand -}
let tr = Impulse(7, 0) * SinOsc(331, 0);
let env = Decay2(tr, { TRand(0.01, 0.05, tr) } ! 2, { TRand(0.05, 0.15, tr) } ! 2);
Rlpf(LfSaw(TRand(321, 333, tr), 0), (LfNoise1(2) * 4 + 100).MidiCps, 1) * env
