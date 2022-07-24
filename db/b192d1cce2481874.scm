; Ring2
(let ((a (FSinOsc 800 0))
      (b (FSinOsc (XLine 200 500 5 doNothing) 0)))
  (Mul (Ring2 a b) 0.1))
