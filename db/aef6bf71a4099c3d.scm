; pv_localmax
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) a))
       (h (PV_LocalMax f (MouseX kr 0 100 0 0.1))))
  (Mul (ifft* h) 0.5))
