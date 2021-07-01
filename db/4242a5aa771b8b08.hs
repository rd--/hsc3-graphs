-- bufCombC ; used as an echo (filtered decaying noise bursts)
let b = localBufId 'α' 1 44100
    d = dustId 'β' ar 1
    n = whiteNoiseId 'γ' ar
    i = decay (d * 0.5) 0.2 * n
in bufCombC b i 0.2 3
