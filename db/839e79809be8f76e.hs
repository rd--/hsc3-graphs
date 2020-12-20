-- pv_ConformalMap
let i = soundIn 0
    x = mouseX KR (-1) 1 Linear 0.1
    y = mouseY KR (-1) 1 Linear 0.1
in pan2 (ifft' (pv_ConformalMap (fft' (localBuf 'α' 1024 1) i) x y)) 0 1
