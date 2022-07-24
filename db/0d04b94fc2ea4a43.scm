; RunningMax
(let* ((t (Impulse (MouseX 0.01 2 1 0.1) 0))
       (f (MulAdd (RunningMax (SinOsc 2 0) t) 500 200)))
  (Mul (SinOsc f 0) 0.1))
