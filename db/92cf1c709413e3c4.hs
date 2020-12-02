-- MiClouds ; 3=SPECTRAL ; (this mode causes high CPU peaks)
let buf = control KR "buf" 0
    nc = 2
    input = playBuf nc AR buf 1 1 0 Loop DoNothing
    size = 0.35
    dens = 0.02
    tex = 0.3
in X.miClouds AR 0 0 size dens tex 1 1 0.5 0.8 0.8 0 (X.miClouds_mode "SPECTRAL") 0 0 input * 0.35
