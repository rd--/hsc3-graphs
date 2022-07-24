; Ring2 ; written out
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Add3 (Mul a b) a b) 0.1))
