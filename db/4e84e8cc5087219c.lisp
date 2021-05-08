; PeakFollower ; a little decay
(let* ((s (Mul (Dust ar 20) (Line kr 0 1 4 do-nothing)))
       (f (MulAdd (PeakFollower s 0.999) 1500 200)))
  (Mul (SinOsc ar f 0) 0.1))
