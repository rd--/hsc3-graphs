; pv_rectcomb
(let* ((b (LocalBuf 1 2048))
       (p (MulAdd (LFTri kr 0.097 0) 0.4 0.5))
       (w (MulAdd (LFTri kr 0.24 0) -0.5 0.5))
       (n (Mul (WhiteNoise ar) 0.1)))
  (Pan2 (ifft* (PV_RectComb (fft* b n) 8 p w)) 0 1))
