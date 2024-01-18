; Fft
(let* ((s (Mul (WhiteNoise) 0.05))
       (c (FftDefaults (LocalBuf 1 2048) s)))
  (IfftDefaults c))
