; sqrsum
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 do-nothing) 0)))
  (Mul (mce2 (SqrSum a b) (Mul (Add a b) (Add a b))) 0.05))
