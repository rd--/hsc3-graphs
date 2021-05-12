; pv_phaseshift90
(let ((n (Mul (WhiteNoise ar) 0.05)))
  (ifft* (PV_PhaseShift90 (fft* (LocalBuf 1 2048) n))))
