; pv_magsmear
(let* ((b (ctl "buf" 0))
       (s (PlayBuf 1 b (BufRateScale b) 1 0 noLoop doNothing))
       (x (MouseX 0 100 0 0.1))
       (c0 (FftDefaults (LocalBuf 1 2048) s))
       (c1 (PV_MagSmear c0 x)))
  (Mce2 s (IfftDefaults c1)))
