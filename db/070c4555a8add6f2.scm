; pv_magnoise
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) a))
       (h (PV_MagNoise f)))
  (mce2 a (ifft* h)))