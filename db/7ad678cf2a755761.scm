; Median ; filter for high frequency noise & leakdc for low frequency noise
(let* ((s0 (MulAdd (WhiteNoise) 0.05 (Mul (SinOsc 800 0) 0.1)))
       (s1 (Median 31 s0)))
  (LeakDC s1 0.9))
