; sqr-dif
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (mce2 (sqr-dif a b) (mul (sub a b) (sub a b))) 0.05))
