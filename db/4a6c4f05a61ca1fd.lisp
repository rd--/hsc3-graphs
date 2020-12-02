; pv-mag-squared
(let* ((b (ctl kr "buf" 0))
       (a (play-buf 1 ar b (buf-rate-scale kr b) 1 0 loop do-nothing))
       (c (fft* (local-buf 1 2048) a)))
  (mul 0.003 (ifft* (pv-mag-squared c))))
