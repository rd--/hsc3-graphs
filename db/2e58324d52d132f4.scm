; pv_binwipe
(let* ((a (Mul (WhiteNoise ar) 0.05))
       (b (Mul (SinOsc ar 100 0) 0.2))
       (f (fftDefaults (LocalBuf 1 2048) a))
       (g (fftDefaults (LocalBuf 1 2048) b))
       (h (PV_BinWipe f g (MouseX kr -1 1 0 0.1))))
  (Mul (ifftDefaults h) 0.5))
