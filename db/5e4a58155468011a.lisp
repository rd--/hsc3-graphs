; delay-c ; c.f. delay-n
(let ((z (mul (decay (dust ar 1) 0.05) (white-noise ar))))
  (add (delay-c z 0.2 0.2) z))
