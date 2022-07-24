; FBSineC ; increase feedback
(let ((fb (Line 0.01 4 10 doNothing)))
  (Mul (FBSineC (SampleRate) 1 fb 1.1 0.5 0.1 0.1) 0.1))
