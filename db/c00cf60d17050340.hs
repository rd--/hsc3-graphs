-- klang ; note SC2 had mul/add inputs
let f = [440,550..1100]
    a = take 7 (cycle [0.05, 0.02])
    p = replicate 7 0
in klang AR 1 0 (klangSpec f a p)
