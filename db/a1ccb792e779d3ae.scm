; klank
(let ((i (Mul (PinkNoise ar) (Mce2 0.002 0.002)))
      (d (klankData '(200 671 1153 1723)
		     (replicate 4 1)
		     (replicate 4 1))))
  (Klank i 1 0 1 d))
