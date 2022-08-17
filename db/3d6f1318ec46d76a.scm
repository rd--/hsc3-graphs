; pv_phaseshift90
(let ((n (Mul (WhiteNoise) 0.05)))
  (IfftDefaults (PV_PhaseShift90 (FftDefaults (LocalBuf 1 2048) n))))
