-- allpassN ; used as an echo, c.f. comb ; outputs signal immediately (inverted), lower amplitude
let n = whiteNoise 'ε' AR
    d = dust 'ζ' AR 1
    src = decay (d * 0.25) 0.2 * n
in allpassN src 0.2 0.2 3
