; ring1 ; c.f. mul ring1 ring2 ring3 ring4
(let ((a (f-sin-osc ar 800 0))
      (b (f-sin-osc ar (x-line kr 200 500 5 do-nothing) 0)))
  (mul (ring1 a b) 0.1))
