; klank
(let ((i (mul (pink-noise ar) 0.007))
      (d (klank-data '(800 1071 1353 1723)
		     (replicate 4 1)
		     (replicate 4 1))))
  (klank i 1 0 1 d))
