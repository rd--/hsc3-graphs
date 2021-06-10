; ring1 ; written out
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 doNothing) 0)))
  (Mul (Add (Mul a b) a) 0.1))
