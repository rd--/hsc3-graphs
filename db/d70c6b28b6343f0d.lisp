; fft
(let* ((s (Mul (WhiteNoise ar) 0.05))
       (c (fft* (LocalBuf 1 2048) s)))
  (ifft* c))
