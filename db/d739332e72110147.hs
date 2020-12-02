-- pmOsc ; random parameters, linear modulation index motion over n seconds
let n = 2
    cf = rand 'α' 0 2000
    mf = rand 'β' 0 800
    pme = rand 'γ' 0 12
    l = rand 'δ' (-1) 1
    pm = line KR 0 pme n DoNothing
in linPan2 (pmOsc AR cf mf pm 0) l 0.05
