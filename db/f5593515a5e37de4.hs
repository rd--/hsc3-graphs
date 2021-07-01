-- tBrownRand
let t = dustId 'α' kr 10
    n = X.tBrownRandId 'β' 0 1 0.2 0 t
    f = linExp n 0 1 300 3000
    o = sinOsc ar f 0
    l = X.tBrownRandId 'γ' (-1) 1 1 4 t
in pan2 o l 0.1
