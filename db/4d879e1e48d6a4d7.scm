; runningmax
(let* ((t (Impulse 0.4 0))
       (f (MulAdd (RunningMax (Dust 20) t) 500 200)))
  (Mul (SinOsc f 0) 0.1))
