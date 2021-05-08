; PV_PhaseShift270
(let ((n (Mul (WhiteNoise ar) 0.1)))
  (ifft* (PV_PhaseShift270 (fft* (LocalBuf 1 2048) n))))
