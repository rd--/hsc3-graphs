-- wind metals (jmcc) ; texture=overlap,5,2,12,inf
let n = 6
    base = expRand 60 4000
    exc = mceFill 2 (\_ -> brownNoise ar) * 0.007 * max 0 (lfNoise1 kr (expRand 0.125 0.5) * 0.75 + 0.25)
    k = klankSpec_mce (mceFill n (\_ -> rand base (base + rand 500 8000))) (mceConst n 1) (mceFill n (\_ -> rand 0.1 2))
in softClip (klank exc 1 0 1 k * 0.1)
