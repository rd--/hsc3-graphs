; pv-copy-phase
(let* ((b (ctl kr "buf" 0))
       (p (mul (white-noise ar) 0.1))
       (q (play-buf 1 ar b (buf-rate-scale kr b) 0 0 loop do-nothing))
       (f (fft* (local-buf 1 2048) p))
       (g (fft* (local-buf 1 2048) q))
       (h (pv-copy-phase f g)))
  (mul (ifft* h) 0.1))
