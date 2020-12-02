; pv-bin-scramble ; sample buffer input
(let* ((b (ctl kr "buf" 0))
       (a (play-buf 1 ar b (buf-rate-scale kr b) 1 0 loop do-nothing))
       (f (fft* (local-buf 1 2048) a))
       (g (pv-bin-scramble f
                           (mouse-x kr 0.0 1.0 0 0.1)
                           (mouse-y kr 0.0 1.0 0 0.1)
                           (impulse kr 4 0)))
       (h (ifft* g)))
  (mul 0.5 (mce2 h h)))
