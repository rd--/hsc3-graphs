; freq-shift ; modulating shift and phase
(let ((i (sin-osc ar 10 0))
      (s (mul (lf-noise2 ar 0.3) 1500))
      (p (lin-lin (sin-osc ar 500 0) -1 1 0 (* 2 pi))))
  (mul (freq-shift i s p) 0.1))
