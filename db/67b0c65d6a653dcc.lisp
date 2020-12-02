; pv-phase-shift90
(let ((n (mul (white-noise ar) 0.05)))
  (ifft* (pv-phase-shift90 (fft* (local-buf 1 2048) n))))
