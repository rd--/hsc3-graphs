; sprinkler (jmcc) #1
(let* ((f (MulAdd (LfPulse 0.09 0 0.16) 10 7))
       (t (Mul (LfPulse f 0 0.25) 0.1)))
  (Bpz2 (Mul (WhiteNoise) t)))
