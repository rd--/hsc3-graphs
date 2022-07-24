; BufAllpassN
(let ((x (Mul3 (Decay (Dust 1) 0.2) (WhiteNoise) 0.1)))
  (BufAllpassN (LocalBuf 1 48000) x 0.25 6))
