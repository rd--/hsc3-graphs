-- allpassN ; used as an echo, c.f. comb ; outputs signal immediately (inverted), lower amplitude
let n = whiteNoiseId 'ε' ar
    d = dustId 'ζ' ar 1
    src = decay (d * 0.25) 0.2 * n
in allpassN src 0.2 0.2 3
