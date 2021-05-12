; pv_copyphase
(let* ((b (ctl kr "buf" 0))
       (p (Mul (WhiteNoise ar) 0.1))
       (q (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) p))
       (g (fft* (LocalBuf 1 2048) q))
       (h (PV_CopyPhase f g)))
  (Mul (ifft* h) 0.1))
