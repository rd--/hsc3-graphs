; FFT
(let* ((f1 (Squared (MulAdd (SinOsc 0.08 0) 6 6.2)))
       (f2 (MulAdd (SinOsc f1 0) 100 800))
       (s (SinOsc f2 0)))
  (Mul (ifftDefaults (fftDefaults (LocalBuf 1 2048) s)) 0.1))
