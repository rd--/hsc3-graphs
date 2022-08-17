; pv_add
(let* ((b0 (ClearBuf (LocalBuf 1 2048)))
       (b1 (ClearBuf (LocalBuf 1 2048)))
       (b2 (ctl "buf" 0))
       (a (PlayBuf 1 b2 (BufRateScale b2) 0 0 loop doNothing))
       (f (FftDefaults b0 a))
       (g (FftDefaults b1 (Mul (SinOsc 110 0) 0.2)))
       (h (PV_Add f g)))
  (Mul (IfftDefaults h) 0.5))
