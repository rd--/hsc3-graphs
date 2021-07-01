-- localBuf ; allocate a buffer local to the synthesis graph, 1-channel, 2048
let nc = 1
    nf = 2048
    buf = localBufId 'α' nc nf
    f = fft' buf (whiteNoiseId 'β' ar)
    c = pv_BrickWall f (sinOsc kr 0.1 0 * 0.75)
in ifft' c * 0.1
