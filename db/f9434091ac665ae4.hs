-- pv_RectCommb ; lfo control
let z = soundIn 0
    b = localBufId 'γ' 2048 1
    p = lfTri kr 0.097 0 *   0.4  + 0.5
    w = lfTri kr 0.240 0 * (-0.5) + 0.5
    c = pv_RectComb (fft' b z) 8 p w
in pan2 (ifft' c) 0 1
