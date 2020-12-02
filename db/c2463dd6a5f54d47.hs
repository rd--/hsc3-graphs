-- bufDelayC ; dust randomly triggers decay to create an envelope
let b = localBuf 'α' 1 44100
    t = dust 'β' AR 1
    n = whiteNoise 'γ' AR
    d = decay t 0.5 * n * 0.2
in bufDelayC b d 0.2 + d
