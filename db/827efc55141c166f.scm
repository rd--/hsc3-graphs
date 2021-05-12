; pv_copyphase
(let* ((a (Mul (WhiteNoise ar) 0.1))
       (b (Mul (SinOsc ar 100 0) 0.2))
       (f (fft* (LocalBuf 1 2048) a))
       (g (fft* (LocalBuf 1 2048) b))
       (h (PV_CopyPhase f g)))
  (Mul (ifft* h) 0.5))
