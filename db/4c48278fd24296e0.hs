-- randSeed ; start a sound that includes noise ugens
let n = mceFillId 'α' 2 (\z _ -> whiteNoiseId z ar * 0.05 + dust2Id z ar 70)
    f = lfNoise1Id 'β' kr 3 * 5500 + 6000
in resonz (n * 5) f 0.5 + n * 0.5
