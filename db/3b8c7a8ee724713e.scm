; pv_rectcomb
(let* ((b (LocalBuf 1 2048))
       (x (MouseX 0 0.5 0 0.1))
       (y (MouseY 0 0.5 0 0.1))
       (n (Mul (WhiteNoise) 0.1)))
  (Pan2 (ifftDefaults (PV_RectComb (fftDefaults b n) 8 x y)) 0 1))
