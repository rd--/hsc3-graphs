-- localBuf ; allocate a buffer local to the synthesis graph, 1-channel, 2048
let nc = 1
    nf = 2048
    buf = localBuf 'α' nc nf
    f = fft' buf (whiteNoise 'β' AR)
    c = pv_BrickWall f (sinOsc KR 0.1 0 * 0.75)
in ifft' c * 0.1
