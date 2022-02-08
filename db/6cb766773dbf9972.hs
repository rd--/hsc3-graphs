-- MiClouds ; basic granulation ; requires=buf (stereo) ; 0=GRANULAR
let (buf, nc) = (control kr "buf" 0, 2)
    input = playBuf nc ar buf 1 1 0 Loop DoNothing
    dens = lfNoise1Id 'α' kr 0.3 `in_range` (0.3,0.45)
in X.miClouds ar 0 0 0 dens 0.5 1 1 0.5 0 0 0 (X.miClouds_mode "GRANULAR") 0 0 input
