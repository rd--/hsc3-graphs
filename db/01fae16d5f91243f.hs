-- pv_BrickWall ; ln 2021-04-19 https://lukasnowok.github.io/spectrology/
let geom k z m = mce (take k (iterate (* m) z))
    s = mix (sinOsc AR (geom 100 20000 1.1 * line AR 1 0 20 DoNothing) 0 * 0.1)
    w = lfSaw AR (xLine AR 4 0.1 20 DoNothing) 0
in ifft' (pv_BrickWall (fft' (localBuf 'α' 1 1024) s) w) * 0.1
