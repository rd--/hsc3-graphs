; runningmax
(let* ((t (Impulse ar 0.4 0))
       (f (MulAdd (RunningMax (Dust ar 20) t) 500 200)))
  (Mul (SinOsc ar f 0) 0.1))
