; pv_diffuser
(let* ((b (ctl kr "buf" 0))
       (a (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) a))
       (h (PV_Diffuser f (GT (MouseX kr 0 1 0 0.1) 0.5))))
  (Mul (ifft* h) 0.5))
