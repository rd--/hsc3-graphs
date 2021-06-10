; BufCombL
(let ((x (Mul3 (Decay (Dust ar 1) 0.2) (WhiteNoise ar) 0.1)))
  (BufCombL (LocalBuf 1 48000) x 0.25 6))
