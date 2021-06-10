; pv_copyphase
(let* ((a (Mul (WhiteNoise ar) 0.1))
       (b (Mul (SinOsc ar 100 0) 0.2))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (g (fftDefaults (LocalBuf 1 2048) b))
       (h (PV_CopyPhase f g)))
  (Mul (ifftDefaults h) 0.5))
