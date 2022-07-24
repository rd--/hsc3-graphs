; PeakFollower ; follow sine lfo
(let* ((x (MouseX 0.99 1.0001 1 0.1))
       (s (SinOsc 0.2 0))
       (f (MulAdd (PeakFollower s (Min x 1.0)) 200 500)))
  (Mul (SinOsc f 0) 0.1))
