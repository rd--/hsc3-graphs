-- pv_BrickWall ; ln 2021-04-19 https://lukasnowok.github.io/spectrology/
let geom k z m = mce (take k (iterate (* m) z))
    s = mix (sinOsc ar (geom 100 20000 1.1 * line ar 1 0 20 DoNothing) 0 * 0.1)
    w = lfSaw ar (xLine ar 4 0.1 20 DoNothing) 0
in ifft' (pv_BrickWall (fft' (localBufId 'α' 1 1024) s) w) * 0.1
