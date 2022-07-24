; sqrsum
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Mce2 (SqrSum a b) (Mul (Add a b) (Add a b))) 0.05))
