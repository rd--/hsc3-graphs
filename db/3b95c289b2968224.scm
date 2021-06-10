; pv_copyphase
(let* ((b (ctl kr "buf" 0))
       (p (Mul (WhiteNoise ar) 0.1))
       (q (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) p))
       (g (fftDefaults (LocalBuf 1 2048) q))
       (h (PV_CopyPhase f g)))
  (Mul (ifftDefaults h) 0.1))
