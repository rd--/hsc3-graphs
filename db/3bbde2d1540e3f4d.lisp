; buf-rate-scale
(let* ((b (ctl kr "buf" 0))
       (r (mul (rand 0.5 2) (buf-rate-scale kr b)))
       (p (phasor ar 0 r 0 (buf-frames kr b) 0)))
  (buf-rd 1 ar b p 0 2))
