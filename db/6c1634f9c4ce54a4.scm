; pv_phaseshift
(let ((n (Mul (WhiteNoise) 0.05))
      (x (MouseX 0 1 0 0.1)))
  (IfftDefaults (PV_PhaseShift (FftDefaults (LocalBuf 1 2048) n) x 0)))
