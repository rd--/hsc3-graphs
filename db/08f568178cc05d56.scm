; PV_BinScramble ; sample buffer input
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 1 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (g (PV_BinScramble f
                           (MouseX 0.0 1.0 0 0.1)
                           (MouseY 0.0 1.0 0 0.1)
                           (Impulse 4 0)))
       (h (ifftDefaults g)))
  (Mul 0.5 (Mce2 h h)))
