-- pmi ; texture=overlap,1,2,7,inf ; id
let n = randId 'α' 1 12
    cf = randId 'β' 0 2000
    mf = randId 'γ' 0 800
    pme = randId 'δ' 0 12
    l = randId 'ε' (-1) 1
    pm = line kr 0 pme n DoNothing
in linPan2 (pmOsc ar cf mf pm 0) l 0.05
