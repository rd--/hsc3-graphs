-- coolant (jmcc) #2 ; texture=overlap,4,4,2,inf
let p = 10
    spec freq = let n = mceFill p (const 1) in klankSpec_mce freq n n
    gen _ = klank (onePole (brownNoise ar * 0.0015) 0.95) 1 0 1 (spec (X.rRandN p 40 2400))
in mceFill 2 gen
