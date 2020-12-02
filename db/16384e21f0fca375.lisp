; buf-delay-l ; c.f. delay-l
(let ((z (mul3 (decay (dust ar 1) 0.1) 0.3 (white-noise ar))))
  (add (buf-delay-l (local-buf 1 48000) z 0.2) z))
