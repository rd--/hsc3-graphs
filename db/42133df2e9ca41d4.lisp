; ring2 ; written out
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (sum3 (mul a b) a b) 0.1))
