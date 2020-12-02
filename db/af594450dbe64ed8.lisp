; klank ; c.f. klang
(let ((i (mul (impulse ar 2 0) 0.1))
      (d (klank-data '(800 1071 1153 1723)
		     (replicate 5 1)
		     (replicate 5 1))))
  (klank i 1 0 1 d))
