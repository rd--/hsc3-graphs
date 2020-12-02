-- tBrownRand
let t = dust 'α' KR 10
    n = X.tBrownRand 'β' 0 1 0.2 0 t
    f = linExp n 0 1 300 3000
    o = sinOsc AR f 0
    l = X.tBrownRand 'γ' (-1) 1 1 4 t
in pan2 o l 0.1
