-- pv_Invert
let z = sinOsc AR 440 0 * 0.4 + pinkNoise 'α' AR * 0.1
    c0 = fft' (localBuf 'β' 2048 1) z
    c1 = X.pv_Invert c0
in mce2 z (ifft' c1) * 0.5