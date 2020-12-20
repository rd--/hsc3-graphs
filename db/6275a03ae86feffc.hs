-- pv_Compander ; sustainer
let z = decay2 (impulse AR 8 0 * lfSaw KR 0.3 0 * 0.3) 0.001 0.3 * mix (pulse AR (mce [80, 81]) 0.3)
    x = mouseX KR 1 80 Linear 0.1
    s = ifft' (X.pv_Compander (fft' (localBuf 'γ' 2048 1) z) x 0.5 1.0)
in mce [z, limiter s 0.999 0.05]
