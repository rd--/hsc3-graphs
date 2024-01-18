; FreqShift ; shifting bandpassed noise
(let ((i (Bpf (WhiteNoise) 1000 0.001))
      (s (Mul (LfNoise0 5.5) 1000)))
  (Mul (FreqShift i s 0) 32))
