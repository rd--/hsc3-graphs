-- bottle (sc) ; texture=overlap,2,0,4,inf ; id
let freq = rand 220 880
    perc = envPerc 0.1 0.6
    ex = envGen kr 1 1 0 1 DoNothing perc * whiteNoise ar * 0.02
    flute = ringz ex freq 0.3
    r = resonz (pinkNoise ar) (5 + (freq / 2)) 0.1
    breath = envGen kr 1 1 0 1 DoNothing perc * r
    rapf i = i + allpassN i 0.1 (linRand 0.001 0.1 (-1)) 1.0 * 0.5
    cls i = let en = let c = EnvNum (-4) in (c,c,c)
                l = envLinen_c 0.01 3.0 1.0 1 en
                z = (breath + i) * envGen kr 1 1 0 1 RemoveSynth l
            in mce2 z z
in cls (iter 2 rapf flute)
