; PeakFollower ; a little decay
(let* ((s (Mul (Dust 20) (Line 0 1 4 doNothing)))
       (f (MulAdd (PeakFollower s 0.999) 1500 200)))
  (Mul (SinOsc f 0) 0.1))
