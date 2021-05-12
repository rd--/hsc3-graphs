; sprinkler (jmcc) #1
(let* ((f (MulAdd (LFPulse kr 0.09 0 0.16) 10 7))
       (t (Mul (LFPulse kr f 0 0.25) 0.1)))
  (BPZ2 (Mul (WhiteNoise ar) t)))
