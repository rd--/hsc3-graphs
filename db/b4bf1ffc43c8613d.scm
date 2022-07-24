; IFFT
(let* ((s (Mul (Add (SinOsc 440 0) (WhiteNoise)) 0.025))
       (c (fftDefaults (LocalBuf 1 2048) s)))
  (ifftDefaults c))
