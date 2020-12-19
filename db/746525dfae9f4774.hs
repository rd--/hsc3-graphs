-- pv_HainsworthFoote ; spot note transitions
let s = lfSaw AR (lfNoise0 'β' KR 1 * 90 + 400) 0 * 0.5
    b = localBuf 'γ' 2048 1
    f = fft' b s
    d = pv_HainsworthFoote f 1.0 0.0 0.9 0.5
    t = sinOsc AR 440 0 * decay (d * 0.1) 0.1 * 0.1
in mce2 (s * 0.05) t
