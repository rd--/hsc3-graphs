-- pv_BrickWall ; ln 2021-04-18 https://lukasnowok.github.io/spectrology/
let e1 = envGen AR (impulse KR 1.1 0) 1 0 1 DoNothing (envPerc 0 1.2)
    o1 = ifft' (pv_BrickWall (fft' (localBuf 'α' 1 1024) (whiteNoise 'β' AR * e1)) 0.601)
    e2 = envGen AR (impulse KR 0.7 0) 1 0 1 DoNothing (envPerc 1 0)
    o2 = ifft' (pv_BrickWall (fft' (localBuf 'γ' 1 1024) (whiteNoise 'δ' AR * e2 * xLine AR 0.01 1 20 DoNothing)) (-0.5))
    o3 = lfTri AR 12000  0
in (o1 + o2 + o3) * 0.1
