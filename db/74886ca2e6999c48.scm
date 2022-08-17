; pv_copyphase
(let* ((a (Mul (WhiteNoise) 0.1))
       (b (Mul (SinOsc 100 0) 0.2))
       (f (FftDefaults (LocalBuf 1 2048) a))
       (g (FftDefaults (LocalBuf 1 2048) b))
       (h (PV_CopyPhase f g)))
  (Mul (IfftDefaults h) 0.5))
