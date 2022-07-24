; DelayL ; c.f DelayN
(let ((z (Mul (Decay (Dust 1) 0.05) (WhiteNoise))))
  (Add (DelayL z 0.2 0.2) z))
