-- MiClouds ; spectral again ; watch volume
let (buf, nc) = (control kr "buf" 100, 2)
    input = playBuf nc ar buf 1 1 0 Loop DoNothing
    size = squared (range 0.1 0.5 (lfNoise1Id 'α' kr 0.2))
    dens = lfNoise1Id 'β' kr 0.3 * 0.5 + 0.5
    tex = lfNoise1Id 'γ' kr 0.3 * 0.5 + 0.5
in X.miClouds ar 0 0 size dens tex 1 1 0.5 0.6 0.6 0 (X.miClouds_mode "SPECTRAL") 1 0 input * 0.25
