-- wind metals (jmcc) ; texture=overlap,5,2,12,inf
let n = 6
    base = expRand 'α' 60 4000
    rng = rand 'β' 500 8000
    n0 = mce2 (brownNoise 'γ' AR) (brownNoise 'δ' AR)
    r0 = expRand 'ε' 0.125 0.5
    n1 = lfNoise1 'ζ' KR r0
    f = X.rRandN n 'η' base (base + rng)
    dt = X.rRandN n 'θ' 0.1 2
    exc = n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
    k = klankSpec_mce f (mce (replicate n 1)) dt
    s = klank exc 1 0 1 k
in softClip (s * 0.1)
