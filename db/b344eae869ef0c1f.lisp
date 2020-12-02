; sum-sqr
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (mce2 (sum-sqr a b) (add (mul a a) (mul b b))) 0.05))
