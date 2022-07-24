; runningmin
(let* ((t (Impulse 2.0 0))
       (f (MulAdd (RunningMin (Sub 1 (Dust 20)) t) 500 200)))
 (Mul (SinOsc f 0) 0.1))
