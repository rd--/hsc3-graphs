; pv_magfreeze
(let* ((b (ctl kr "buf" 0))
       (s (PlayBuf 1 ar b (BufRateScale kr b) 1 0 loop doNothing))
       (f (GT (MouseY kr 0 1 0 0.1) 0.5)))
  (Pan2 (ifftDefaults (PV_MagFreeze (fftDefaults (LocalBuf 1 2048) s) f)) 0 0.25))
