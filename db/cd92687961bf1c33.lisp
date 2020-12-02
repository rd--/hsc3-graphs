; pv-rand-comb
(let ((n (mul (white-noise ar) 0.1))
      (x (mouse-x kr 0.6 0.95 0 0.1))
      (t (impulse kr 0.4 0)))
  (pan2 (ifft* (pv-rand-comb (fft* (local-buf 1 2048) n) x t)) 0 1))
