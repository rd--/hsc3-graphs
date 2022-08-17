; Pv_MagNoise
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (FftDefaults (LocalBuf 1 2048) a))
       (h (PV_MagNoise f)))
  (List a (IfftDefaults h)))
