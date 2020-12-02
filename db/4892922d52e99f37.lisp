; pv-rect-comb
(let* ((b (local-buf 1 2048))
       (x (mouse-x kr 0 0.5 0 0.1))
       (y (mouse-y kr 0 0.5 0 0.1))
       (n (mul (white-noise ar) 0.1)))
  (pan2 (ifft* (pv-rect-comb (fft* b n) 8 x y)) 0 1))
