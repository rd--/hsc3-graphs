; pv-mag-clip
(let* ((b (ctl kr "buf" 0))
       (a (play-buf 1 ar b (buf-rate-scale kr b) 0 0 loop do-nothing))
       (f (fft* (local-buf 1 2048) a))
       (h (pv-mag-clip f (mouse-x kr 0 5 0 0.1))))
  (mul (ifft* h) 0.5))
