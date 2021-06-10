; pv_phaseshift90
(let ((n (Mul (WhiteNoise ar) 0.05)))
  (ifftDefaults (PV_PhaseShift90 (fftDefaults (LocalBuf 1 2048) n))))
