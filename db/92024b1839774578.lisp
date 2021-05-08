; setresetff
(let ((n (BrownNoise ar))
      (g (SetResetFF (Dust ar 5) (Dust ar 5))))
  (mul3 n g 0.1))
