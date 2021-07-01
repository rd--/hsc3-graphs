-- moogFF
let n = lfNoise0Id 'α' kr 0.43
    p = pulse ar (mce [40, 121]) (mce [0.3, 0.7])
    f0 = linLin n 0 1 0.001 2.2
    f = linLin (sinOsc kr f0 0) (-1) 1 30 4200
    y = mouseY kr 1 4 Linear 0.1
in moogFF p f (0.83 * y) 0
