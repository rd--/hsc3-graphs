; pv_magfreeze
(let* ((b (ctl "buf" 0))
       (s (PlayBuf 1 b (BufRateScale b) 1 0 loop doNothing))
       (f (Gt (MouseY 0 1 0 0.1) 0.5)))
  (Pan2 (IfftDefaults (PV_MagFreeze (FftDefaults (LocalBuf 1 2048) s) f)) 0 0.25))
