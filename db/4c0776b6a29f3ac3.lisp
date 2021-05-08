; ring4
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 do-nothing) 0)))
  (Mul (mce2 (Ring4 a b) (Sub (mul3 a a b) (mul3 a b b))) 0.1))
