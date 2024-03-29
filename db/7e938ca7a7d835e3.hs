-- pv_ConformalMap ; with filtering
let z = soundIn 0
    x = mouseX kr 0.01  2.0 Linear 0.1
    y = mouseY kr 0.01 10.0 Linear 0.1
    c = fft' (localBufId 'β' 2048 1) z
    m = ifft' (pv_ConformalMap c x y)
in pan2 (combN m 0.1 0.1 10 * 0.5 + m) 0 0.5
