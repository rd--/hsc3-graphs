; PeakFollower ; MouseX controls decay
(let* ((x (MouseX kr 0.99 1.0001 1 0.1))
       (s (Mul (Dust ar 20) (Line kr 0 1 4 doNothing)))
       (f (MulAdd (PeakFollower s (Min x 1.0)) 1500 200)))
  (Mul (SinOsc ar f 0) 0.1))
