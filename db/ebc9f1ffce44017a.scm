; PV_BinScramble ; sample buffer input
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 1 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) a))
       (g (PV_BinScramble f
                           (MouseX kr 0.0 1.0 0 0.1)
                           (MouseY kr 0.0 1.0 0 0.1)
                           (Impulse kr 4 0)))
       (h (ifft* g)))
  (Mul 0.5 (mce2 h h)))
