-- pv_Compander ; sustainer
let z = decay2 (impulse ar 8 0 * lfSaw kr 0.3 0 * 0.3) 0.001 0.3 * mix (pulse ar (mce [80, 81]) 0.3)
    x = mouseX kr 1 80 Linear 0.1
    s = ifft' (X.pv_Compander (fft' (localBufId 'γ' 2048 1) z) x 0.5 1.0)
in mce [z, limiter s 0.999 0.05]
