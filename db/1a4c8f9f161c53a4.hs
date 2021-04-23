-- sinOsc ; ln 2021-04-05 https://lukasnowok.github.io/spectrology/
let geom k z m = mce (take k (iterate (* m) z))
    o1 = sinOsc AR 10000 0 * geom 4 0.01 8
    o2 = sinOsc AR (lfSaw AR (geom 4 0.05 2) 0 * geom 4 1000 2) 0
in mix (o1 * o2) * 1/4 * 0.1
