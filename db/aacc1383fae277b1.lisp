; pv-mag-smear
(let* ((b (ctl kr "buf" 0))
       (s (play-buf 1 ar b (buf-rate-scale kr b) 1 0 no-loop do-nothing))
       (x (mouse-x kr 0 100 0 0.1))
       (c0 (fft* (local-buf 1 2048) s))
       (c1 (pv-mag-smear c0 x)))
  (mce2 s (ifft* c1)))
