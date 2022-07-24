; sqrdif
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Mce2 (SqrDif a b) (Mul (Sub a b) (Sub a b))) 0.05))
