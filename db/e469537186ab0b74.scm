; FBSineC ; increase phase multiplier
(let ((a (Line 1 2 10 doNothing)))
  (Mul (FBSineC (SampleRate) 1 0 a 0.5 0.1 0.1) 0.1))
