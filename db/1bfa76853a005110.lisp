; moogff
(let ((n (Mul (WhiteNoise ar) 0.1))
      (y (MouseY kr 100 10000 1 0.1))
      (x (MouseX kr 0 4 0 0.1)))
  (MoogFF n y x 0))
