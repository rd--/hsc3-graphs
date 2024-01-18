; Ifft
(let* ((s (Mul (Add (SinOsc 440 0) (WhiteNoise)) 0.025))
       (c (FftDefaults (LocalBuf 1 2048) s)))
  (IfftDefaults c))
