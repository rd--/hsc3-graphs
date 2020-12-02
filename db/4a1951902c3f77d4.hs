-- MiClouds ; using external grain trigger
let buf = control KR "buf" 0
    nc = 2
    input = playBuf nc AR buf 1 1 0 Loop DoNothing
    dens = 0.5
    tr = dust 'α' KR 10
in X.miClouds AR (-5) 0 0.2 dens 0.5 1 1 0.5 0 0 0 (X.miClouds_mode "GRANULAR") 0 tr input
