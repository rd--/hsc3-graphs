; runningmin
(let* ((t (Impulse (MouseX 0.5 4 1 0.1) 0))
       (f (MulAdd (RunningMin (Sub 2 (SinOsc 2 0)) t) 500 200)))
  (Mul (SinOsc f 0) 0.1))
