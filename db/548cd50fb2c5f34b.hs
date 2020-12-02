-- tRand ; c.f. X.tGaussRand
let t = dust 'α' KR 10
    f = tRand 'β' 300 3000 t
    o = sinOsc AR f 0
    l = tRand 'γ' (-1) 1 t
in pan2 o l 0.1
