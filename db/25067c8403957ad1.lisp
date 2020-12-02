; pv-add
(let* ((b0 (clear-buf (local-buf 1 2048)))
       (b1 (clear-buf (local-buf 1 2048)))
       (b2 (ctl kr "buf" 0))
       (a (play-buf 1 ar b2 (buf-rate-scale kr b2) 0 0 loop do-nothing))
       (f (fft* b0 a))
       (g (fft* b1 (mul (sin-osc ar 110 0) 0.2)))
       (h (pv-add f g)))
  (mul (ifft* h) 0.5))
