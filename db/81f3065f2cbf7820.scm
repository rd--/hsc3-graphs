; pv_randcomb
(let ((n (Mul (WhiteNoise) 0.1))
      (x (MouseX 0.6 0.95 0 0.1))
      (t (Impulse 0.4 0)))
  (Pan2 (IfftDefaults (PV_RandComb (FftDefaults (LocalBuf 1 2048) n) x t)) 0 1))
