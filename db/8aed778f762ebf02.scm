; FbSineC ; increase phase multiplier
(let ((a (Line 1 2 10 doNothing)))
  (Mul (FbSineC (SampleRate) 1 0 a 0.5 0.1 0.1) 0.1))
