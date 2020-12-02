; pv-mag-freeze
(let* ((b (ctl kr "buf" 0))
       (s (play-buf 1 ar b (buf-rate-scale kr b) 1 0 loop do-nothing))
       (f (gt (mouse-y kr 0 1 0 0.1) 0.5)))
  (pan2 (ifft* (pv-mag-freeze (fft* (local-buf 1 2048) s) f)) 0 0.25))
