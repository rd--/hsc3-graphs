; ring1 ; written out
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Add (Mul a b) a) 0.1))
