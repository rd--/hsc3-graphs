-- dseq ; ln 2021-04-06 https://lukasnowok.github.io/spectrology/
let geom k z m = mce (take k (iterate (* m) z))
    d = demand (impulse AR 8 0) 0 (dseq 'α' dinf (geom 9 1 1.25))
    e = xLine AR 1 0.7 20 DoNothing
in mix (sinOsc AR (geom 8 60 2 * d * e) 0) * 1/5 * 0.1
