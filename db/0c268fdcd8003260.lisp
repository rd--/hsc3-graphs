; moog-ff
(let ((n (mul (white-noise ar) 0.1))
      (y (mouse-y kr 100 10000 1 0.1))
      (x (mouse-x kr 0 4 0 0.1)))
  (moog-ff n y x 0))
