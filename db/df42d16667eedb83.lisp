; RunningMax
(let* ((t (Impulse kr (MouseX kr 0.01 2 1 0.1) 0))
       (f (MulAdd (RunningMax (SinOsc kr 2 0) t) 500 200)))
  (Mul (SinOsc ar f 0) 0.1))
