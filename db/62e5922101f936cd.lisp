; pv-diffuser
(let* ((b (ctl kr "buf" 0))
       (a (play-buf 1 ar b (buf-rate-scale kr b) 0 0 loop do-nothing))
       (f (fft* (local-buf 1 2048) a))
       (h (pv-diffuser f (gt (mouse-x kr 0 1 0 0.1) 0.5))))
  (mul (ifft* h) 0.5))
