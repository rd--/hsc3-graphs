; klank
(let ((i (Mul (Dust ar 8) 0.1))
      (d (klank-data '(800 1071 1353 1723)
		     (replicate 4 1)
		     (replicate 4 1))))
  (Klank i 1 0 1 d))
