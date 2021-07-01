-- bowed string (jmcc) ; texture=overlap,5,2,12,inf
let root = 5
    scale = map (+ root) [0,2,4,5,7,9,11]
    oct = [24,36,48,60,72,84]
    f = midiCPS (lchoose scale + lchoose oct)
    x = mce2 (brownNoise ar) (brownNoise ar) * 0.007 * max 0 (lfNoise1 kr (expRand 0.125 0.5) * 0.6 + 0.4)
    geom n i z = mce (take n (iterate (* z) i))
    iota n i z = mce (take n (iterate (+ z) i))
    d = klankSpec_mce (iota 12 f f) (geom 12 1 (rand 0.7 0.9)) (X.rRandN 12 1.0 3.0)
    k = klank x 1 0 1 d
in softClip (k * 0.1)
