; ring1 ; c.f. Mul ring1 ring2 ring3 ring4
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 doNothing) 0)))
  (Mul (Ring1 a b) 0.1))
