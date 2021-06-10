; pv_magsmear
(let* ((b (ctl kr "buf" 0))
       (s (PlayBuf 1 ar b (BufRateScale kr b) 1 0 noLoop doNothing))
       (x (MouseX kr 0 100 0 0.1))
       (c0 (fftDefaults (LocalBuf 1 2048) s))
       (c1 (PV_MagSmear c0 x)))
  (Mce2 s (ifftDefaults c1)))
