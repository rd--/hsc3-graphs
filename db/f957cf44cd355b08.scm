; ring3
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 doNothing) 0)))
  (Mul (Mce2 (Ring3 a b) (Mul3 a a b)) 0.1))
