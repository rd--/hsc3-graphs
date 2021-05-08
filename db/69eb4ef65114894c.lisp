; pv_rectcomb
(let* ((b (LocalBuf 1 2048))
       (x (MouseX kr 0 0.5 0 0.1))
       (y (MouseY kr 0 0.5 0 0.1))
       (n (Mul (WhiteNoise ar) 0.1)))
  (Pan2 (ifft* (PV_RectComb (fft* b n) 8 x y)) 0 1))
