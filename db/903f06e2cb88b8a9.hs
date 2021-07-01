-- pmOsc ; random parameters, linear modulation index motion over n seconds
let n = 2
    cf = randId 'α' 0 2000
    mf = randId 'β' 0 800
    pme = randId 'γ' 0 12
    l = randId 'δ' (-1) 1
    pm = line kr 0 pme n DoNothing
in linPan2 (pmOsc ar cf mf pm 0) l 0.05
