; DelayC ; c.f. delay-n
(let ((z (Mul (Decay (Dust 1) 0.05) (WhiteNoise))))
  (Add (DelayC z 0.2 0.2) z))
