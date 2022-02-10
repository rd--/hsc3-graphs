-- expRandN ; n node klang synthesis
let n = 240
    f = X.expRandNId n 'α' 40 18000
    a = X.expRandNId n 'β' 0.1 0.3
    p = X.randNId n 'γ' (-1) 1
    s = klangSpec_mce f a p
in klang ar 1 0 s * 0.01
