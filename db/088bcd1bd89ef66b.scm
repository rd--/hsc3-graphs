; pv_diffuser
(let* ((b (ctl "buf" 0))
       (a (PlayBuf 1 b (BufRateScale b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (h (PV_Diffuser f (Gt (MouseX 0 1 0 0.1) 0.5))))
  (Mul (ifftDefaults h) 0.5))
