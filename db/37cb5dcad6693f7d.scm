; Excess ; written out
(let ((a (FSinOsc 1000 0))
      (b (Line 0 1 8 doNothing)))
  (Mul (Sub a (Clip2 a b)) 0.1))
