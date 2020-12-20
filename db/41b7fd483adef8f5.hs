-- pv_Compander ; mostly expand
let z = decay2 (impulse AR 8 0 * lfSaw KR 0.3 0 * 0.3) 0.001 0.3 * mix (pulse AR (mce [80, 81]) 0.3)
    x = mouseX KR 1 50 Linear 0.1
in mce [z, ifft' (X.pv_Compander (fft' (localBuf 'β' 2048 1) z) x 2.0 0.85)]
