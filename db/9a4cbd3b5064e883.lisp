; fft
(let* ((f1 (Squared (MulAdd (SinOsc kr 0.08 0) 6 6.2)))
       (f2 (MulAdd (SinOsc kr f1 0) 100 800))
       (s (SinOsc ar f2 0)))
  (Mul (ifft* (fft* (LocalBuf 1 2048) s)) 0.1))
