; PV_BinWipe ; requires=buf
(let* ((b (ctl "buf" 0))
       (p (Mul (WhiteNoise) 0.05))
       (q (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) p))
       (g (fftDefaults (LocalBuf 1 2048) q))
       (h (PV_BinWipe f g (MouseX -1 1 0 0.1))))
  (Mul (ifftDefaults h) 0.5))
