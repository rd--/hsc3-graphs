; BufDelayL ; c.f. DelayL
(let ((z (Mul3 (Decay (Dust 1) 0.1) 0.3 (WhiteNoise))))
  (Add (BufDelayL (LocalBuf 1 48000) z 0.2) z))
