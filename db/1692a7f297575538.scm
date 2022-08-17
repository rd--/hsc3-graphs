; pv_copyphase
(let* ((b (ctl "buf" 0))
       (p (Mul (WhiteNoise) 0.1))
       (q (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (FftDefaults (LocalBuf 1 2048) p))
       (g (FftDefaults (LocalBuf 1 2048) q))
       (h (PV_CopyPhase f g)))
  (Mul (IfftDefaults h) 0.1))
