; runningmin
(let* ((t (Impulse ar 2.0 0))
       (f (MulAdd (RunningMin (Sub 1 (Dust ar 20)) t) 500 200)))
 (Mul (SinOsc ar f 0) 0.1))
