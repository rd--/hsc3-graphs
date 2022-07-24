; sumsqr
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Mce2 (SumSqr a b) (Add (Mul a a) (Mul b b))) 0.05))
