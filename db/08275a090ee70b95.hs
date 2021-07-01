-- tRand ; c.f. X.tGaussRand
let t = dustId 'α' kr 10
    f = tRandId 'β' 300 3000 t
    o = sinOsc ar f 0
    l = tRandId 'γ' (-1) 1 t
in pan2 o l 0.1
