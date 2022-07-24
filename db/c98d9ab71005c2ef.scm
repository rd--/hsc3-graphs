; see BufDelayN
(let ((z (Mul3 (Decay (Dust 1) 0.1) 0.3 (WhiteNoise))))
  (Add (BufDelayN (LocalBuf 1 48000) z 0.2) z))
