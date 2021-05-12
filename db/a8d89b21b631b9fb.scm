; ring2 ; written out
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 do-nothing) 0)))
  (Mul (Sum3 (Mul a b) a b) 0.1))
