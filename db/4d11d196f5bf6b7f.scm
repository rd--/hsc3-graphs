; PV_PhaseShift270
(let ((n (Mul (WhiteNoise) 0.1)))
  (ifftDefaults (PV_PhaseShift270 (fftDefaults (LocalBuf 1 2048) n))))
