; ring4
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (mce2 (ring4 a b) (sub (mul3 a a b) (mul3 a b b))) 0.1))
