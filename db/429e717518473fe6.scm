; FreqShift ; modulating shift and phase
(let ((i (SinOsc 10 0))
      (s (Mul (LfNoise2 0.3) 1500))
      (p (LinLin (SinOsc 500 0) -1 1 0 (* 2 pi))))
  (Mul (FreqShift i s p) 0.1))
