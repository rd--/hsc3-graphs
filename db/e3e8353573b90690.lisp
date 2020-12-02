; wrap
(let ((o (mul (sin-osc ar 440 0) 0.1))
      (x (mouse-x kr -0.1 -0.025 1 0.1))
      (y (mouse-y kr 0.025 0.1 1 0.1)))
  (wrap o x y))
