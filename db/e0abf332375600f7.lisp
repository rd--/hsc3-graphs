; klank
(let ((i (mul (pink-noise ar) (mce2 0.002 0.002)))
      (d (klank-data '(200 671 1153 1723)
		     (replicate 4 1)
		     (replicate 4 1))))
  (klank i 1 0 1 d))