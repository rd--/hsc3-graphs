; fft
(let* ((s (mul (white-noise ar) 0.05))
       (c (fft* (local-buf 1 2048) s)))
  (ifft* c))
