; pv_localmax
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (h (PV_LocalMax f (MouseX 0 100 0 0.1))))
  (Mul (ifftDefaults h) 0.5))
