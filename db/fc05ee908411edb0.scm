; PV_BinWipe ; requires=buf
(let* ((b (ctl kr "buf" 0))
       (p (Mul (WhiteNoise ar) 0.05))
       (q (PlayBuf 1 ar b (BufRateScale kr b) 0 0 loop do-nothing))
       (f (fft* (LocalBuf 1 2048) p))
       (g (fft* (LocalBuf 1 2048) q))
       (h (PV_BinWipe f g (MouseX kr -1 1 0 0.1))))
  (Mul (ifft* h) 0.5))
