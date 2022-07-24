; Klank
(let ((i (Mul (PinkNoise) 0.007))
      (d (klankData
	  (list 800 1071 1353 1723)
	  (replicate 4 1)
	  (replicate 4 1))))
  (Klank i 1 0 1 d))
