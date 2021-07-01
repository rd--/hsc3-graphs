-- rRandN ; n node klang synthesis ; id
let n = 240
    f = X.rRandNId n 'α' 40 18000
    a = X.rRandNId n 'β' 0.1 0.3
    p = X.rRandNId n 'γ' (-1) 1
    s = klangSpec_mce f a p
in klang ar 1 0 s * 0.05
