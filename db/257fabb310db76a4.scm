; PV_BinWipe ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (p (Mul (WhiteNoise ar) 0.05))
       (q (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) p))
       (g (fftDefaults (LocalBuf 1 2048) q))
       (h (PV_BinWipe f g (MouseX kr -1 1 0 0.1))))
  (Mul (ifftDefaults h) 0.5))
