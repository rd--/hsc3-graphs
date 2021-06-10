; FBSineC ; increase phase multiplier
(let ((a (Line kr 1 2 10 doNothing)))
  (Mul (FBSineC ar SampleRate 1 0 a 0.5 0.1 0.1) 0.1))
