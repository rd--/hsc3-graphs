; pv-mag-noise
(let* ((b (ctl kr "buf" 0))
       (a (play-buf 1 ar b (buf-rate-scale kr b) 0 0 loop do-nothing))
       (f (fft* (local-buf 1 2048) a))
       (h (pv-mag-noise f)))
  (mce2 a (ifft* h)))
