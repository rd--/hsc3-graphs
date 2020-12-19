-- pv_RectCommb ; mouse control
let z = soundIn 0
    b = localBuf 'β' 2048 1
    x = mouseX KR 0 0.5 Linear 0.1
    y = mouseY KR 0 0.5 Linear 0.1
    c = pv_RectComb (fft' b z) 8 x y
in pan2 (ifft' c) 0 1
