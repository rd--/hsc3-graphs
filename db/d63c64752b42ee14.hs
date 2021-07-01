-- pv_HainsworthFoote ; spot note transitions
let s = lfSaw ar (lfNoise0Id 'β' kr 1 * 90 + 400) 0 * 0.5
    b = localBufId 'γ' 2048 1
    f = fft' b s
    d = pv_HainsworthFoote f 1.0 0.0 0.9 0.5
    t = sinOsc ar 440 0 * decay (d * 0.1) 0.1 * 0.1
in mce2 (s * 0.05) t
