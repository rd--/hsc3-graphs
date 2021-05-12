; PeakFollower ; follow sine lfo
(let* ((x (MouseX kr 0.99 1.0001 1 0.1))
       (s (SinOsc kr 0.2 0))
       (f (MulAdd (PeakFollower s (Min x 1.0)) 200 500)))
  (Mul (SinOsc ar f 0) 0.1))
