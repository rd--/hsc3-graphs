; moogff
(let ((n (Mul (WhiteNoise) 0.1))
      (y (MouseY 100 10000 1 0.1))
      (x (MouseX 0 4 0 0.1)))
  (MoogFF n y x 0))
