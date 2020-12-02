; henon-n ; frequency control
(let ((x (mouse-x kr 1 1.4 0 0.1))
      (y (mouse-y kr 0 0.3 0 0.1))
      (f 40))
  (mul (sin-osc ar (mul-add (henon-n ar f x y 0 0) 800 900) 0) 0.05))
