; PeakFollower ; MouseX controls decay
(let* ((x (MouseX 0.99 1.0001 1 0.1))
       (s (Mul (Dust 20) (Line 0 1 4 doNothing)))
       (f (MulAdd (PeakFollower s (Min x 1.0)) 1500 200)))
  (Mul (SinOsc f 0) 0.1))
