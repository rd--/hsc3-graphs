; pv_phaseshift
(let ((n (Mul (WhiteNoise ar) 0.05))
      (x (MouseX kr 0 1 0 0.1)))
  (ifft* (PV_PhaseShift (fft* (LocalBuf 1 2048) n) x 0)))
