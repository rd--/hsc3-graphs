// allpassN ; all pass delay (left to right)
Dust(1).mul(0.25).decay(0.2).mul(WhiteNoise()).allpassN(0.2, 0.2, 3)

// allpassN ; all pass delay (right to left)
AllpassN.ar(Decay.ar(Dust.ar(1) * 0.25, 0.2) * WhiteNoise.ar, 0.2, 0.2, 3)
