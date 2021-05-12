; DelayN ; see delay-n
(let ((z (Mul (Decay (Dust ar 1) 0.05) (WhiteNoise ar))))
  (Add (DelayL z 0.2 0.2) z))
