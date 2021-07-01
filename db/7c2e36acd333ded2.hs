-- miElements ; metal, bells
let tr = dustId 'α' ar 2.5
    inp = decay tr 0.01
    g = X.tBrownRandId 'β' 0.5 0.9 0.2 0 (coinGateId 'γ' 0.05 tr)
    space = range 0.5 1 (lfNoise1Id 'δ' kr 0.1)
in X.miElements ar 0 inp 0 40 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 g 0.4 0.9 0.2 space 0 0 * 0.35
