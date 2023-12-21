; PV_RectComb
(let* ((b (LocalBuf 1 2048))
       (p (MulAdd (LfTri 0.097 0) 0.4 0.5))
       (w (MulAdd (LfTri 0.24 0) -0.5 0.5))
       (n (Mul (WhiteNoise) 0.1)))
  (Pan2 (IfftDefaults (PV_RectComb (FftDefaults b n) 8 p w)) 0 1))
