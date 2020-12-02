; gate
(let ((s (mul (f-sin-osc ar 500 0) 1/4))
      (t (lf-pulse ar 1 0 1/10)))
  (gate s t))
