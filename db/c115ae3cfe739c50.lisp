; dif-sqr ; written out
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (sub (mul a a) (mul b b)) 0.1))
