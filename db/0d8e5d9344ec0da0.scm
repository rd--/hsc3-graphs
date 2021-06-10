; pv_magclip
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop doNothing))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (h (PV_MagClip f (MouseX kr 0 5 0 0.1))))
  (Mul (ifftDefaults h) 0.5))
