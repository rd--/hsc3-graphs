; BufDelayL ; c.f. DelayL
(let ((z (Mul3 (Decay (Dust ar 1) 0.1) 0.3 (WhiteNoise ar))))
  (Add (BufDelayL (LocalBuf 1 48000) z 0.2) z))
