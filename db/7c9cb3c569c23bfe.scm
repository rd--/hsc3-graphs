; sqrdif
(let ((a (FSinOsc ar 800 0))
      (b (FSinOsc ar (XLine kr 200 500 5 do-nothing) 0)))
  (Mul (mce2 (SqrDif a b) (Mul (Sub a b) (Sub a b))) 0.05))
