; ring4
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 doNothing) 0)))
  (Mul (Mce2 (Ring4 a b) (Sub (Mul3 a a b) (Mul3 a b b))) 0.1))
