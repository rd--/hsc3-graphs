; pv_magclip
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (FftDefaults (LocalBuf 1 2048) a))
       (h (PV_MagClip f (MouseX 0 5 0 0.1))))
  (Mul (IfftDefaults h) 0.5))
