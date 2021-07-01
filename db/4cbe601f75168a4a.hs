-- bufDelayC ; dust randomly triggers decay to create an envelope
let b = localBufId 'α' 1 44100
    t = dustId 'β' ar 1
    n = whiteNoiseId 'γ' ar
    d = decay t 0.5 * n * 0.2
in bufDelayC b d 0.2 + d
