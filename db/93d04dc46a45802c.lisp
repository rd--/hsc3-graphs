; pv-rect-comb
(let* ((b (local-buf 1 2048))
       (p (mul-add (lf-tri kr 0.097 0) 0.4 0.5))
       (w (mul-add (lf-tri kr 0.24 0) -0.5 0.5))
       (n (mul (white-noise ar) 0.1)))
  (pan2 (ifft* (pv-rect-comb (fft* b n) 8 p w)) 0 1))
