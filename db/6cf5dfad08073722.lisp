; buf-allpass-l
(let ((x (mul3 (decay (dust ar 1) 0.2) (white-noise ar) 0.1)))
  (buf-allpass-l (local-buf 1 48000) x 0.25 6))
