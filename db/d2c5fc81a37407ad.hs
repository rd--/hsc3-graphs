-- MiClouds ; using external grain trigger ; requires=buf (stereo)
let (buf, nc) = (control kr "buf" 100, 2)
    input = playBuf nc ar buf 1 1 0 Loop DoNothing
    dens = 0.5
    tr = dustId 'α' kr 10
in X.miClouds ar (-5) 0 0.2 dens 0.5 1 1 0.5 0 0 0 (X.miClouds_mode "GRANULAR") 0 tr input
