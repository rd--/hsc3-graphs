; wrap
(let ((o (mul (sin-osc ar 440 0) 0.1))
      (l (rand -0.1 -0.025))
      (r (rand 0.025 0.1)))
  (wrap o l r))
