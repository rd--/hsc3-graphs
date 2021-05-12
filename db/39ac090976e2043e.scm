; BufDelayC ; c.f. DelayN
(let ((z (mul3 (Decay (Dust ar 1) 0.1) 0.3 (WhiteNoise ar))))
  (Add (BufDelayC (LocalBuf 1 48000) z 0.2) z))
