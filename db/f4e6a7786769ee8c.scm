; pv_magsquared
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 1 0 loop doNothing))
       (c (FftDefaults (LocalBuf 1 2048) a)))
  (Mul 0.003 (IfftDefaults (PV_MagSquared c))))
