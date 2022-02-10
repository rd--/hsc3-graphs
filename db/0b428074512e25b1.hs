-- wind metals (jmcc) ; texture=overlap,5,2,12,inf ; id
let n = 6
    base = expRandId 'α' 60 4000
    rng = randId 'β' 500 8000
    n0 = mce2 (brownNoiseId 'γ' ar) (brownNoiseId 'δ' ar)
    r0 = expRandId 'ε' 0.125 0.5
    n1 = lfNoise1Id 'ζ' kr r0
    f = X.randNId n 'η' base (base + rng)
    dt = X.randNId n 'θ' 0.1 2
    exc = n0 * 0.007 * max 0 (n1 * 0.75 + 0.25)
    k = klankSpec_mce f (mce (replicate n 1)) dt
    s = klank exc 1 0 1 k
in softClip (s * 0.1)
