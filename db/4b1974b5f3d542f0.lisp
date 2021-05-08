; FreqShift ; shifting bandpassed noise
(let ((i (BPF (WhiteNoise ar) 1000 0.001))
      (s (Mul (LFNoise0 ar 5.5) 1000)))
  (Mul (FreqShift i s 0) 32))
