; pv_magnoise
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (h (PV_MagNoise f)))
  (Mce2 a (ifftDefaults h)))