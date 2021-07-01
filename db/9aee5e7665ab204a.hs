-- pv_ConformalMap
let i = soundIn 0
    x = mouseX kr (-1) 1 Linear 0.1
    y = mouseY kr (-1) 1 Linear 0.1
in pan2 (ifft' (pv_ConformalMap (fft' (localBufId 'α' 1024 1) i) x y)) 0 1
