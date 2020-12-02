-- MiClouds ; basic granulation ; requires=buf (stereo) ; 0=GRANULAR
let buf = control KR "buf" 0
    nc = 2
    input = playBuf nc AR buf 1 1 0 Loop DoNothing
    dens = range 0.3 0.45 (lfNoise1 'α' KR 0.3)
in X.miClouds AR 0 0 0 dens 0.5 1 1 0.5 0 0 0 (X.miClouds_mode "GRANULAR") 0 0 input
