; FreqShift ; modulating shift and phase
(let ((i (SinOsc ar 10 0))
      (s (Mul (LFNoise2 ar 0.3) 1500))
      (p (LinLin (SinOsc ar 500 0) -1 1 0 (* 2 pi))))
  (Mul (FreqShift i s p) 0.1))
