-- bufCombC ; used as an echo (filtered decaying noise bursts)
let b = localBuf 'α' 1 44100
    d = dust 'β' AR 1
    n = whiteNoise 'γ' AR
    i = decay (d * 0.5) 0.2 * n
in bufCombC b i 0.2 3
