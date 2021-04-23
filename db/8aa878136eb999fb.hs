-- pv_BrickWall ; ln 2021-04-12 https://lukasnowok.github.io/spectrology/
let c0 = localBuf 'α' 1 1024
    c1 = fft' c0 (whiteNoise 'β' AR)
    c2 = pv_BrickWall c1 (line AR (-1) 1 20 DoNothing)
in ifft' c2 * 0.1
