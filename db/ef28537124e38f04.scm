; pv_magfreeze
(let ((s (SinOsc (MulAdd (LfNoise1 5.2) 250 400) 0))
      (f (SinOsc 0.2 0)))
  (Pan2 (IfftDefaults (PV_MagFreeze (FftDefaults (LocalBuf 1 2048) s) f)) 0 0.25))
