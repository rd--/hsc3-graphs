; pluck ; excitation signal is white-noise, triggered twice a second with varying one-pole coef
(let ((n (mul (white-noise ar) 0.1))
      (t (impulse kr 2 0))
      (x (mouse-x kr -0.999 0.999 0 0.1))
      (dl (/ 1 440)))
  (pluck n t dl dl 10 x))
