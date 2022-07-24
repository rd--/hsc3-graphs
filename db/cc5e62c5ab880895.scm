; HPF
(let* ((i (Mul (Saw 200) 0.05))
       (f1 (XLine 0.7 300 20 doNothing))
       (f2 (MulAdd (FSinOsc f1 0) 3600 4000)))
  (Mul (HPF i f2) 5))
