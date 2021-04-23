-- pv_RandComb ; ln 2021-04-07 https://lukasnowok.github.io/spectrology/
let c0 = localBuf 'α' 1 1024
    tr = impulse KR 7 0
    env = envGen KR tr 1 0 1 DoNothing (Envelope [0,1,1,0] [0,0.1,0] [] Nothing Nothing 0)
    c1 = fft' c0 (whiteNoise 'β' AR)
    c2 = pv_RandComb 'γ' c1 (line KR 0.6 1 20 DoNothing) tr
    c3 = pv_BrickWall c2 0.05
in (ifft' c3 * env + sinOsc AR 1000 0 * 0.2) * 0.1
