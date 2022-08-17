; pv_binwipe
(let* ((a (Mul (WhiteNoise) 0.05))
       (b (Mul (SinOsc 100 0) 0.2))
       (f (FftDefaults (LocalBuf 1 2048) a))
       (g (FftDefaults (LocalBuf 1 2048) b))
       (h (PV_BinWipe f g (MouseX -1 1 0 0.1))))
  (Mul (IfftDefaults h) 0.5))
