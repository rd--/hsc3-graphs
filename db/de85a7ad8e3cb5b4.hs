-- randSeed ; start a sound that includes noise ugens
let n = mceFill_z 'α' 2 (\z _ -> whiteNoise z AR * 0.05 + dust2 z AR 70)
    f = lfNoise1 'β' KR 3 * 5500 + 6000
in resonz (n * 5) f 0.5 + n * 0.5
