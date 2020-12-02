-- MiClouds ; spectral again ; watch volume
let buf = control KR "buf" 0
    nc = 2
    input = playBuf nc AR buf 1 1 0 Loop DoNothing
    size = squared (range 0.1 0.5 (lfNoise1 'α' KR 0.2))
    dens = lfNoise1 'β' KR 0.3 * 0.5 + 0.5
    tex = lfNoise1 'γ' KR 0.3 * 0.5 + 0.5
in X.miClouds AR 0 0 size dens tex 1 1 0.5 0.6 0.6 0 (X.miClouds_mode "SPECTRAL") 1 0 input * 0.25
