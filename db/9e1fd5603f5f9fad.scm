; runningmin
(let* ((t (Impulse kr (MouseX kr 0.5 4 1 0.1) 0))
       (f (MulAdd (RunningMin (Sub 2 (SinOsc kr 2 0)) t) 500 200)))
  (Mul (SinOsc ar f 0) 0.1))
