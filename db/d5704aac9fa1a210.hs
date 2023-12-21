-- MiClouds ; 3=SPECTRAL ; (this mode causes high CPU peaks)
let (buf, nc) = (control kr "buf" 100, 2)
    input = playBuf nc ar buf 1 1 0 Loop DoNothing
    size = 0.35
    dens = 0.02
    tex = 0.3
in X.miClouds ar 0 0 size dens tex 1 1 0.5 0.8 0.8 0 (X.miClouds_mode "SPECTRAL") 0 0 input * 0.35
