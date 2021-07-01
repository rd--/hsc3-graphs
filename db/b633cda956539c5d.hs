-- pv_RandComb ; ln 2021-04-07 https://lukasnowok.github.io/spectrology/
let c0 = localBufId 'α' 1 1024
    tr = impulse kr 7 0
    env = envGen kr tr 1 0 1 DoNothing (Envelope [0,1,1,0] [0,0.1,0] [] Nothing Nothing 0)
    c1 = fft' c0 (whiteNoiseId 'β' ar)
    c2 = pv_RandCombId 'γ' c1 (line kr 0.6 1 20 DoNothing) tr
    c3 = pv_BrickWall c2 0.05
in (ifft' c3 * env + sinOsc ar 1000 0 * 0.2) * 0.1
