-- pv_RandComb
let z = soundIn 0
    t = impulse kr 0.5 0
    x = mouseX kr 0.6 0.95 Linear 0.1
    c = pv_RandCombId 'α' (fft' (localBufId 'α' 2048 1) z) x t
in pan2 (ifft' c) 0 1
