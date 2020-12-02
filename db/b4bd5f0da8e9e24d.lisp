; pv-mag-smear
(let* ((s (mul (lf-saw ar 500 0) (decay2 (mul (impulse ar 2 0) 0.1) 0.01 2)))
       (x (mouse-x kr 0 100 0 0.1))
       (c0 (fft* (local-buf 1 2048) s))
       (c1 (pv-mag-smear c0 x)))
  (ifft* c1))
