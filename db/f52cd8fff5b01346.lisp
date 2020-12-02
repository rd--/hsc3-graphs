; pv-phase-shift270
(let ((n (mul (white-noise ar) 0.1)))
  (ifft* (pv-phase-shift270 (fft* (local-buf 1 2048) n))))
