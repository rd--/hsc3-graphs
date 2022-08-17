; sprinkler (jmcc) #1 ; kr
(let* ((f (MulAdd (LFPulse 0.09 0 0.16) 10 7))
       (t (Mul (LFPulse f 0 0.25) 0.1)))
  (BPZ2 (Mul (WhiteNoise) (kr: t))))
