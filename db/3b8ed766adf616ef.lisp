; pv_randcomb
(let ((n (Mul (WhiteNoise ar) 0.1))
      (x (MouseX kr 0.6 0.95 0 0.1))
      (t (Impulse kr 0.4 0)))
  (Pan2 (ifft* (PV_RandComb (fft* (LocalBuf 1 2048) n) x t)) 0 1))
