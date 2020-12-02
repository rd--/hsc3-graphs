; pv-phase-shift
(let ((n (mul (white-noise ar) 0.05))
      (x (mouse-x kr 0 1 0 0.1)))
  (ifft* (pv-phase-shift (fft* (local-buf 1 2048) n) x 0)))
