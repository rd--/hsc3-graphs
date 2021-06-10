; fft
(let* ((s (Mul (WhiteNoise ar) 0.05))
       (c (fftDefaults (LocalBuf 1 2048) s)))
  (ifftDefaults c))
