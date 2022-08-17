; PV_PhaseShift270
(let ((n (Mul (WhiteNoise) 0.1)))
  (IfftDefaults (PV_PhaseShift270 (FftDefaults (LocalBuf 1 2048) n))))
