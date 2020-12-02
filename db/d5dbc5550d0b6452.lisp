; pv-brick-wall
(let ((x (mouse-x kr -1 1 0 0.1))
      (c (fft* (local-buf 1 2048) (mul (white-noise ar) 0.1))))
  (ifft* (pv-brick-wall c x)))
