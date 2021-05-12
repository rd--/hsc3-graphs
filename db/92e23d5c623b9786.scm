; pv_add
(let* ((b0 (ClearBuf (LocalBuf 1 2048)))
       (b1 (ClearBuf (LocalBuf 1 2048)))
       (b2 (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b2 (BufRateScale kr b2) 0 0 loop do-nothing))
       (f (fft* b0 a))
       (g (fft* b1 (Mul (SinOsc ar 110 0) 0.2)))
       (h (PV_Add f g)))
  (Mul (ifft* h) 0.5))
