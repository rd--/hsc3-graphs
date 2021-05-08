; delayn
(let ((z (Mul (Decay (Dust ar 1) 0.05) (WhiteNoise ar))))
  (Add (DelayN z 0.2 0.2) z))
