; ifft
(let* ((s (mul (add (sin-osc ar 440 0) (white-noise ar)) 0.025))
       (c (fft* (local-buf 1 2048) s)))
  (ifft* c))
