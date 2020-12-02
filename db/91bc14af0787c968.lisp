; buf-frames
(let* ((b (ctl kr "buf" 0))
       (p (phasor ar 0 (buf-rate-scale kr b) 0 (buf-frames kr b) 0)))
  (buf-rd 1 ar b p 0 2))
