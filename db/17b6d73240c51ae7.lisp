; see buf-delay-n
(let ((z (mul3 (decay (dust ar 1) 0.1) 0.3 (white-noise ar))))
  (add (buf-delay-n (local-buf 1 48000) z 0.2) z))
