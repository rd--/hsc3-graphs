; sqr-sum
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (mce2 (sqr-sum a b) (mul (add a b) (add a b))) 0.05))
