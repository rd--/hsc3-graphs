; pv_magfreeze
(let ((s (SinOsc ar (MulAdd (LFNoise1 kr 5.2) 250 400) 0))
      (f (SinOsc kr 0.2 0)))
  (Pan2 (ifftDefaults (PV_MagFreeze (fftDefaults (LocalBuf 1 2048) s) f)) 0 0.25))
