-- pv_BrickWall ; ln 2021-04-18 https://lukasnowok.github.io/spectrology/
let e1 = envGen ar (impulse kr 1.1 0) 1 0 1 DoNothing (envPerc 0 1.2)
    o1 = ifft' (pv_BrickWall (fft' (localBufId 'α' 1 1024) (whiteNoiseId 'β' ar * e1)) 0.601)
    e2 = envGen ar (impulse kr 0.7 0) 1 0 1 DoNothing (envPerc 1 0)
    o2 = ifft' (pv_BrickWall (fft' (localBufId 'γ' 1 1024) (whiteNoiseId 'δ' ar * e2 * xLine ar 0.01 1 20 DoNothing)) (-0.5))
    o3 = lfTri ar 12000  0
in (o1 + o2 + o3) * 0.1
