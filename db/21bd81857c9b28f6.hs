-- rRandN ; n node klang synthesis
let n = 240
    f = X.rRandN n 'α' 40 18000
    a = X.rRandN n 'β' 0.1 0.3
    p = X.rRandN n 'γ' (-1) 1
    s = klangSpec_mce f a p
in klang AR 1 0 s * 0.05
