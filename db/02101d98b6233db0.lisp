; pv_magsquared
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 1 0 loop do-nothing))
       (c (fft* (LocalBuf 1 2048) a)))
  (Mul 0.003 (ifft* (PV_MagSquared c))))
