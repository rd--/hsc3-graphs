; ifft
(let* ((s (Mul (Add (SinOsc ar 440 0) (WhiteNoise ar)) 0.025))
       (c (fft* (LocalBuf 1 2048) s)))
  (ifft* c))
