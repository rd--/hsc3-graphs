; Pluck ; excitation signal is white-noise, triggered twice a second with varying OnePole coef
(let ((n (Mul (WhiteNoise ar) 0.1))
      (t (Impulse kr 2 0))
      (x (MouseX kr -0.999 0.999 0 0.1))
      (dl 1/440))
  (Pluck n t dl dl 10 x))
