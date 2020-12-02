; pv-copy-phase
(let* ((a (mul (white-noise ar) 0.1))
       (b (mul (sin-osc ar 100 0) 0.2))
       (f (fft* (local-buf 1 2048) a))
       (g (fft* (local-buf 1 2048) b))
       (h (pv-copy-phase f g)))
  (mul (ifft* h) 0.5))
