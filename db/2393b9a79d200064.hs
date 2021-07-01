-- vosim
let p = tRandId 'α' 0 1 (impulse ar 6 0)
    f0 = linLin (lfNoise2Id 'β' kr 4) (-1) 1 3 9
    t = impulse ar (f0 * (1 + (p `greater_than` 0.95))) 0
    x = mouseX kr 0.25 2 Linear 0.2
    y = mouseY kr 0.25 0.75 Linear 0.2
    z = 9
    rng i = linLin i (-1) 1
    mk_nId e = rng (lfNoise2Id e kr z) 0.25 2
    tRId e ll rl = tRandId e (mce ll) (mce rl)
    f = tRId 'γ' [40,120,220] [440,990,880] t
    n = tRId 'δ' [4] [8,16,32] t
    d = tRId 'ε' [0.2,0.4,0.6] [0.6,0.8,1] t
    a = tRId 'ζ' [0] [0.05,0.15,0.25] t
    l = tRId 'η' [-1] [1] t
    xn = mk_nId 'θ'
    yn = mk_nId 'ι'
    v = X.vosim ar t (f * x * xn) n (d * y * yn) * a
in pan2 (mix v) l 1
